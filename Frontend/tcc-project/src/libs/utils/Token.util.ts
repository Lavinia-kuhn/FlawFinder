import { ILogin, PCFUserInformation } from './../models/user.interface';


const key4: string = ("PCFMAN.TOKEN");

const keys = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
export class TokenUtil {

    public static setLocalStorage(userToken: ILogin) {
        const data = JSON.stringify(userToken);
        localStorage.setItem(key4, (data));
    }

    public static getVersionInLocalStorage(): string {
        const data = localStorage.getItem("PCFMV.VERSION")
        if (data)
            return data;
        else
            return null;
    }

    public static getLocalStorage(): ILogin {
        const data = localStorage.getItem(key4);
        if (data)
            return JSON.parse((data));
        else
            return null;
    }

    public static hasTokensLocalStorage(): boolean {
        const token = this.getLocalStorage();
        if (token)
            return true;
        else
            return false;
    }

    public static clearLocalStorage() {
        localStorage.removeItem(key4);
    }



    public static encrypt(value: string) {
        let encrypted = '';
        for (let counter = 0; counter < value.length; counter++) {
            let current = value.charAt(counter);
            const idx = keys.indexOf(current);
            if (idx >= 0) {
                current = keys.charAt((idx + keys.length / 2) % keys.length);
            }
            encrypted += current;
        }
        return encodeURIComponent(encrypted);
    }

}