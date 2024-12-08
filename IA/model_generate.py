import os
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import classification_report
import pickle

# Le o CSV
def carregar_dados(caminho_csv):
    return pd.read_csv(caminho_csv)

# Preprocessamento dos dados
def preprocessar_dados(df):
    # Separa dados com e sem o motivo preenchido
    df_com_motivo = df.dropna(subset=['Motivo_Nao_Deteccao'])
    df_sem_motivo = df[df['Motivo_Nao_Deteccao'].isna()]
    
    # Codifica variáveis categóricas para números
    label_encoders = {}
    for col in df_com_motivo.columns:
        if df_com_motivo[col].dtype == 'object':
            le = LabelEncoder()
            df_com_motivo[col] = le.fit_transform(df_com_motivo[col].astype(str))
            label_encoders[col] = le
    
    return df_com_motivo, df_sem_motivo, label_encoders

# Treina o modelo e salva no diretório C:\
def treinar_modelo(df_com_motivo, label_encoders):
    X = df_com_motivo.drop(columns=['Motivo_Nao_Deteccao'])
    y = df_com_motivo['Motivo_Nao_Deteccao']
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    modelo = RandomForestClassifier(random_state=42)
    modelo.fit(X_train, y_train)
    
    y_pred = modelo.predict(X_test)
    print("Relatório de Classificação:")
    print(classification_report(y_test, y_pred))
    
    # Caminhos para salvar os arquivos em C:\
    modelo_path = r'C:\modelo_random_forest.pkl'
    encoders_path = r'C:\label_encoders.pkl'
    
    # Salva o modelo e os encoders
    with open(modelo_path, "wb") as model_file:
        pickle.dump(modelo, model_file)
    
    with open(encoders_path, "wb") as encoders_file:
        pickle.dump(label_encoders, encoders_file)
    
    print(f"Modelo salvo em: {modelo_path}")
    print(f"Label encoders salvos em: {encoders_path}")
    
    return modelo

# Pipeline principal
def main(caminho_csv):
    # Carrega os dados
    df = carregar_dados(caminho_csv)
    
    # Preprocessa
    df_com_motivo, df_sem_motivo, label_encoders = preprocessar_dados(df)
    
    # Treina o modelo e salva
    modelo = treinar_modelo(df_com_motivo, label_encoders)

# Executa o script
if __name__ == "__main__":
    caminho_csv = r'C:\Users\laviniavk\Downloads\bugs_jira_completos.csv'
    main(caminho_csv)
