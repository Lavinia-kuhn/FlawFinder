from flask import Flask, request, jsonify
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
import pickle
import traceback  # Para capturar stack trace em caso de erro
 
app = Flask(__name__)
 
# Variáveis globais para o modelo e encoders
model = None
label_encoders = {}
 
# Carregar o modelo e os encoders ao iniciar o script
try:
    print("Carregando o modelo e os encoders...")
    model = pickle.load(open("C:\inetpub\wwwroot\FlawFinder\modelo_random_forest.pkl", "rb"))
    label_encoders = pickle.load(open("C:\inetpub\wwwroot\FlawFinder\label_encoders.pkl", "rb"))
    print("Modelo e Label Encoders carregados com sucesso!")
except Exception as e:
    print(f"Erro ao carregar modelo ou encoders: {e}")
    raise
 
# Endpoint para processar o CSV e preencher os motivos
@app.route('/predict_reasons', methods=['POST'])
def predict_reasons():
    try:
        print("Recebendo requisição na rota '/predict_reasons'")
        # Verificar se o arquivo foi enviado
        if 'file' not in request.files:
            return jsonify({'erro': "Nenhum arquivo enviado na requisição"}), 400
        file = request.files['file']
        print("Arquivo recebido: ", file.filename)
        # Carregar o CSV
        df = pd.read_csv(file)
        print("CSV carregado com sucesso. Cabeçalhos: ", list(df.columns))
        # Verificar se a coluna 'Motivo_Nao_Deteccao' existe
        if 'Motivo_Nao_Deteccao' not in df.columns:
            return jsonify({'erro': "A coluna 'Motivo_Nao_Deteccao' não foi encontrada no CSV"}), 400
        # Preprocessar os dados
        df_no_reason = df[df['Motivo_Nao_Deteccao'].isna()]
        print(f"Número de linhas sem motivo preenchido: {len(df_no_reason)}")
        # Codificar as colunas usando os encoders
        for col, le in label_encoders.items():
            if col in df_no_reason.columns:
                print(f"Codificando coluna: {col}")
                df_no_reason[col] = df_no_reason[col].astype(str).map(
                    lambda x: le.transform([x])[0] if x in le.classes_ else -1
                )
        # Verificar se o dataframe está pronto para predição
        X_news = df_no_reason.drop(columns=['Motivo_Nao_Deteccao'])
        print(f"Preparando os dados para predição. Colunas: {list(X_news.columns)}")
        # Fazer as previsões
        previsoes = model.predict(X_news)
        # Inverter a codificação para Motivo_Nao_Deteccao (se o label encoder existir)
        if 'Motivo_Nao_Deteccao' in label_encoders:
            le_motivo = label_encoders['Motivo_Nao_Deteccao']
            df_no_reason['Motivo_Nao_Deteccao'] = le_motivo.inverse_transform(previsoes)
        else:
            df_no_reason['Motivo_Nao_Deteccao'] = previsoes
        print("Previsões realizadas com sucesso.")
        # Retornar os dados preenchidos
        return jsonify(df_no_reason.to_dict(orient='records'))
    except Exception as e:
        print("Erro durante a execução da API:")
        traceback.print_exc()  # Imprime o stack trace completo no log
        return jsonify({'erro': str(e)}), 500
 
if __name__ == '__main__':
    app.run(debug=True)