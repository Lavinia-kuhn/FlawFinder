import { IDashboardDet } from '../models/dashboard.interface';


const keyGridster: string = ("PCFMAN.GRIDSTER");
export class GridsterUtil {

    public static setLocalStorage(userToken: IDashboardDet[]) {
        const data = JSON.stringify(userToken);
        sessionStorage.setItem(keyGridster, (data));
    }

    public static getLocalStorage(): IDashboardDet[] {
        const data = sessionStorage.getItem(keyGridster);
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
        localStorage.removeItem(keyGridster);
    }
}