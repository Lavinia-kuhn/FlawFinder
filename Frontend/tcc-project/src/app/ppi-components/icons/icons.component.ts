import { Component, Input } from '@angular/core';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'ppi-icon',
  template: `<i nz-icon style="color: {{color}}; font-size: {{size}}px" [innerHTML]="icon(name)"></i>`
})

export class PpiIconsComponent {

  PPIIcons: Object = {
    circle: "<svg viewBox='0 0 47 47'><g fill='currentColor'><circle cx='23.5' cy='23.5' r='23.5'></circle></g></svg>",
    grape: "<svg viewBox='0 0 21 21'><g stroke='currentColor' fill='none' fillRule='evenodd'><path d='M.5.5h20v20H.5z' /><g transform='translate(3 2)'><circle cx='2.5' cy='6.5' r='2' /><circle cx='5' cy='2.5' r='2' /><circle cx='7.5' cy='6.5' r='2' /><circle cx='7.5' cy='15' r='2' /><circle cx='10' cy='2.5' r='2' /><circle cx='5' cy='10.75' r='2' /><circle cx='10' cy='10.75' r='2' /><circle cx='12.5' cy='6.5' r='2' /></g></g></svg>",
    back: "<svg viewBox='0 0 39 33'> <g filter='url(#a)' id='a' transform='translate(-30 -17)' fill='currentColor' fillRule='nonzero' fillOpacity='.8'> <path d='M45.397 44.149l-10.072-9.826a1.043 1.043 0 01-.244-.365 1.124 1.124 0 010-.838c.054-.137.137-.261.244-.365l10.072-9.904a1.26 1.26 0 011.725-.019 1.13 1.13 0 01.02 1.65l-8.06 7.854h21.701c.672 0 1.217.521 1.217 1.164 0 .643-.545 1.164-1.217 1.164h-21.7l8.06 7.855c.47.46.461 1.199-.02 1.649a1.26 1.26 0 01-1.726-.02z'/></g></svg>",
    delete: "<svg viewBox='0 0 27 26'><path d='M8.0719 18.8116c.049 1.2242.9972 2.1895 2.1497 2.1884h6.5568c1.1525.0011 2.1007-.9642 2.1497-2.1884L19.35 8.4783H7.65l.4219 10.3333zm7.7127-7.7688c.006-.2725.1624-.4862.3492-.4773.1867.0088.3332.237.3271.5094l-.1538 6.4731c-.0064.2658-.156.4763-.3382.4762-.0918 0-.1796-.0543-.2434-.1506-.0637-.0963-.098-.2263-.0947-.36l.1538-6.4708zm-4.5646-.4773c.0905-.0046.1786.0433.2447.1332.0661.0898.1048.2143.1074.3456l.1582 6.469c.0033.1338-.0311.2639-.0953.3602-.0642.0964-.1526.1507-.245.1507-.1833.0001-.3337-.2105-.3402-.4764l-.1497-6.4763c-.0049-.2662.1366-.49.3199-.506zm8.2558-3.8031h-3.4937V5.5101c0-.2817-.2347-.5101-.5242-.5101H11.542c-.2895 0-.5242.2284-.5242.5101v1.2523H7.5242c-.2895 0-.5242.2284-.5242.5101s.2347.5101.5242.5101h11.9516c.2895 0 .5242-.2284.5242-.51 0-.2818-.2347-.5102-.5242-.5102zM12.2 5.6957h2.6v.6956h-2.6v-.6956z' fill='currentColor' fillRule='nonzero'/></svg>",
    favorites: "<svg viewBox='0 0 34 35'><g filter='url(#a)' id='a' transform='translate(-34 -486)' fill='currentColor' fillRule='nonzero' fillOpacity='.8'><path d='M60.933 501.586l-5.0608 5.0917 1.3204 7.355c.043.2408-.0165.4897-.1617.6774-.1452.1878-.3607.2942-.5864.2898a.7014.7014 0 01-.374-.1016l-5.9848-3.6572-6.0446 3.6369c-.2542.1523-.5665.1312-.8013-.0543-.2348-.1854-.3497-.5016-.2947-.8113l1.3391-7.351-5.046-5.108c-.2133-.2158-.2918-.5466-.201-.8476.0907-.301.3342-.5174.6238-.5543l6.8488-.8899 2.9063-6.7943c.1221-.2825.3823-.4641.6696-.4673.2908.0008.5549.1846.677.4714l2.9064 6.8024 6.8488.9062c.29.0382.5329.2564.6221.5585.0893.3022.0084.6331-.207.8475z'/></g></svg>",
    home: "<svg viewBox='0 0 25 24'><path d='M23.9637 10.5202c-.0977.3332-.3808.5595-.701.5603H21.558v11.1133c0 .4453-.3304.8062-.738.8062h-5.2835c-.4076 0-.738-.361-.738-.8062v-4.5066c0-1.387-1.029-2.5112-2.2986-2.5112-1.2695 0-2.2986 1.1243-2.2986 2.5112v4.5066c0 .4453-.3304.8062-.738.8062H4.18c-.4076 0-.738-.361-.738-.8062V11.0805H1.7373c-.3202-.0008-.6033-.2271-.701-.5603-.0992-.333.0096-.6978.2693-.9029l10.7627-8.465c.2578-.203.6056-.203.8634 0l10.7627 8.465c.2597.2051.3685.57.2693.903z' fill='currentColor' fillRule='nonzero'/></svg>",
    maintenance: "<svg viewBox='0 0 27 26'><path d='M22.844 17.3443c-.9322-1.0182-2.2573-1.4864-3.5613-1.2583l-7.3074-7.9522c.5295-1.9125.0714-3.9871-1.1989-5.4289C9.5061 1.2631 7.6207.6777 5.8426 1.1731c-.1645.0418-.295.178-.3403.3552-.0452.1771.0019.367.1229.4953l2.442 2.6575-.592 2.28-2.0812.6543-2.456-2.6675c-.1191-.1318-.2951-.1818-.4583-.1304-.1632.0515-.2873.1963-.3232.377-.451 1.9335.0888 3.9816 1.413 5.3611 1.3241 1.3795 3.2279 1.8772 4.9833 1.3026l7.3075 7.9523c-.3058 2.0914.7746 4.1305 2.591 4.8904 1.8164.7599 3.8737.0334 4.934-1.7424 1.0604-1.7758.8346-4.1167-.5413-5.6142zm-1.85 4.3183c-.5836.6345-1.5292.6342-2.1123-.0007-.5832-.6348-.5832-1.6638 0-2.2987.5831-.6348 1.5287-.6351 2.1123-.0007.579.639.5748 1.6668-.0093 2.3001h.0093z' fill='currentColor' fillRule='nonzero'/></svg>",
    maintenanceTab: "<svg viewBox='0 0 27 26' style='width: 16px'><path d='M22.844 17.3443c-.9322-1.0182-2.2573-1.4864-3.5613-1.2583l-7.3074-7.9522c.5295-1.9125.0714-3.9871-1.1989-5.4289C9.5061 1.2631 7.6207.6777 5.8426 1.1731c-.1645.0418-.295.178-.3403.3552-.0452.1771.0019.367.1229.4953l2.442 2.6575-.592 2.28-2.0812.6543-2.456-2.6675c-.1191-.1318-.2951-.1818-.4583-.1304-.1632.0515-.2873.1963-.3232.377-.451 1.9335.0888 3.9816 1.413 5.3611 1.3241 1.3795 3.2279 1.8772 4.9833 1.3026l7.3075 7.9523c-.3058 2.0914.7746 4.1305 2.591 4.8904 1.8164.7599 3.8737.0334 4.934-1.7424 1.0604-1.7758.8346-4.1167-.5413-5.6142zm-1.85 4.3183c-.5836.6345-1.5292.6342-2.1123-.0007-.5832-.6348-.5832-1.6638 0-2.2987.5831-.6348 1.5287-.6351 2.1123-.0007.579.639.5748 1.6668-.0093 2.3001h.0093z' fill='currentColor' fillRule='nonzero'/></svg>",
    materials: "<svg viewBox='0 0 27 26'><path d='M13.937 2.0215l3.4278 1.3725a.3.3 0 01.009.5532L8.5194 7.8297a.3.3 0 01-.232.0038L4.432 6.2898a.3.3 0 01.0001-.557l9.2821-3.7114a.3.3 0 01.223.0001zm5.6128 2.2434l3.669 1.4676a.3.3 0 010 .5571l-9.282 3.7113a.3.3 0 01-.2225 0l-3.2326-1.289a.3.3 0 01-.0097-.5532l8.8456-3.8899a.3.3 0 01.2322-.004zm4.6584 17.1023l-8.8843 3.507a.7.7 0 01-.957-.6512V11.4751a.7.7 0 01.4402-.65l8.8843-3.5508a.7.7 0 01.9598.65V20.716a.7.7 0 01-.443.651zM3.9596 7.2738L7.431 8.66a.7.7 0 01.4404.6501v3.4924a.5413.5413 0 101.0826 0v-2.501a.7.7 0 01.9602-.6498l2.9302 1.1732a.7.7 0 01.4398.6499V24.223a.7.7 0 01-.957.6511l-8.8843-3.507a.7.7 0 01-.443-.651V7.9239a.7.7 0 01.9596-.65z' fill='currentColor' fillRule='nonzero'/></svg>",
    materialsTab: "<svg viewBox='0 0 27 26' style='width: 16px'><path d='M13.937 2.0215l3.4278 1.3725a.3.3 0 01.009.5532L8.5194 7.8297a.3.3 0 01-.232.0038L4.432 6.2898a.3.3 0 01.0001-.557l9.2821-3.7114a.3.3 0 01.223.0001zm5.6128 2.2434l3.669 1.4676a.3.3 0 010 .5571l-9.282 3.7113a.3.3 0 01-.2225 0l-3.2326-1.289a.3.3 0 01-.0097-.5532l8.8456-3.8899a.3.3 0 01.2322-.004zm4.6584 17.1023l-8.8843 3.507a.7.7 0 01-.957-.6512V11.4751a.7.7 0 01.4402-.65l8.8843-3.5508a.7.7 0 01.9598.65V20.716a.7.7 0 01-.443.651zM3.9596 7.2738L7.431 8.66a.7.7 0 01.4404.6501v3.4924a.5413.5413 0 101.0826 0v-2.501a.7.7 0 01.9602-.6498l2.9302 1.1732a.7.7 0 01.4398.6499V24.223a.7.7 0 01-.957.6511l-8.8843-3.507a.7.7 0 01-.443-.651V7.9239a.7.7 0 01.9596-.65z' fill='currentColor' fillRule='nonzero'/></svg>",
    menu: "<svg viewBox='0 0 29 21'><path d='M29 1.5c0 .8284-.6716 1.5-1.5 1.5h-26C.6716 3 0 2.3284 0 1.5S.6716 0 1.5 0h26c.8284 0 1.5.6716 1.5 1.5zm0 9c0 .8284-.6716 1.5-1.5 1.5h-26C.6716 12 0 11.3284 0 10.5S.6716 9 1.5 9h26c.8284 0 1.5.6716 1.5 1.5zm-7 9c0 .8284-.6716 1.5-1.5 1.5h-19C.6716 21 0 20.3284 0 19.5S.6716 18 1.5 18h19c.8284 0 1.5.6716 1.5 1.5z' fill='currentColor' fillRule='evenodd' fillOpacity='.8'/></svg>",
    production: "<svg viewBox='0 0 27 26'><path d='M11.4927 26H9.0102c-.4294 0-.7773-.3555-.7773-.7943V13.1105c0-.4388.348-.7943.7773-.7943h2.4825c.4294 0 .7773.3555.7773.7943v12.0952c.0003.4388-.348.7943-.7773.7943zm5.2333 0h-2.4826c-.4293 0-.7773-.3555-.7773-.7943v-16.12c0-.4387.348-.7942.7773-.7942h2.4826c.4293 0 .7772.3555.7772.7942v16.12c0 .4388-.3479.7943-.7772.7943zM6.2598 26H3.7773C3.3479 26 3 25.6445 3 25.2057v-8.0705c0-.4388.348-.7943.7773-.7943h2.4825c.4294 0 .7773.3555.7773.7943v8.0705c0 .4388-.348.7943-.7773.7943zM24.8332 4.1452c.3562.3802.104 1.0302-.3997 1.0302H22.736v20.03c0 .4387-.3479.7943-.7772.7943h-2.4826c-.4293 0-.7773-.3556-.7773-.7943v-20.03h-1.6973c-.5035 0-.7553-.65-.3995-1.0302l3.716-3.9685c.2206-.2356.5784-.2356.7992 0l3.7158 3.9685z' fill='currentColor' fillRule='nonzero'/></svg>",
    productionTab: "<svg viewBox='0 0 27 26' style='width: 16px'><path d='M11.4927 26H9.0102c-.4294 0-.7773-.3555-.7773-.7943V13.1105c0-.4388.348-.7943.7773-.7943h2.4825c.4294 0 .7773.3555.7773.7943v12.0952c.0003.4388-.348.7943-.7773.7943zm5.2333 0h-2.4826c-.4293 0-.7773-.3555-.7773-.7943v-16.12c0-.4387.348-.7942.7773-.7942h2.4826c.4293 0 .7772.3555.7772.7942v16.12c0 .4388-.3479.7943-.7772.7943zM6.2598 26H3.7773C3.3479 26 3 25.6445 3 25.2057v-8.0705c0-.4388.348-.7943.7773-.7943h2.4825c.4294 0 .7773.3555.7773.7943v8.0705c0 .4388-.348.7943-.7773.7943zM24.8332 4.1452c.3562.3802.104 1.0302-.3997 1.0302H22.736v20.03c0 .4387-.3479.7943-.7772.7943h-2.4826c-.4293 0-.7773-.3556-.7773-.7943v-20.03h-1.6973c-.5035 0-.7553-.65-.3995-1.0302l3.716-3.9685c.2206-.2356.5784-.2356.7992 0l3.7158 3.9685z' fill='currentColor' fillRule='nonzero'/></svg>",
    quality: "<svg viewBox='0 0 27 26'><path d='M21.7517 8.2603l-1.315-1.5712a.6574.6574 0 01-.1457-.4646l.1578-2.0821c.0333-.5207-.2985-.9903-.7849-1.1108l-1.9462-.4646c-.1605-.0364-.2996-.1403-.3843-.2872L16.2894.5017c-.2636-.4437-.7974-.6211-1.2583-.4182L13.1942.903a.5854.5854 0 01-.4693 0l-1.849-.7982c-.4638-.1968-.9957-.0123-1.2544.435L8.598 2.3305c-.0862.1446-.2224.249-.3804.2914l-1.942.4857c-.4863.1239-.814.5985-.7729 1.1192l.178 2.078a.6522.6522 0 01-.1416.4688L4.2402 8.3574c-.3233.3997-.3199.9856.0081 1.3811l1.315 1.5712a.6574.6574 0 01.1457.4646l-.1578 2.0822c-.0345.521.2978.9913.7849 1.1107l1.9462.4646c.1599.038.2984.1415.3843.2872l1.044 1.7781c.2623.4454.7975.6232 1.2583.4182l1.8369-.8194a.5854.5854 0 01.4693 0l1.849.7982c.4638.1973.996.0127 1.2544-.435l1.0236-1.7908c.0853-.1446.222-.248.3804-.2871l.4976-.1268c.0081 0 .0162-.0042.0243-.0042l1.4202-.359c.4878-.1215.8166-.5977.7728-1.1192l-.178-2.078a.6522.6522 0 01.1416-.4688l1.2988-1.5838c.3233-.3997.3199-.9856-.0081-1.3811zM22 24.1329L19.4205 19c-.1266.4057-.383.7658-.735 1.0321-.5516.293-1.191.4092-1.8203.3311a3.6026 3.6026 0 00-1.052.0694 3.135 3.135 0 00-.8132.475L17.5626 26l1.25-2.2907c.0993-.1837.3234-.2772.5366-.2238L22 24.133zm-17 0L7.5795 19c.1266.4057.383.7658.735 1.0321.5516.293 1.191.4092 1.8203.3311a3.6026 3.6026 0 011.052.0694c.296.118.5703.2783.8132.475L9.4374 26l-1.25-2.2907c-.0993-.1837-.3234-.2772-.5366-.2238L5 24.133zM16.9234 8.9175l-1.5975 1.5496.4168 2.2385a.256.256 0 01-.051.2062.2318.2318 0 01-.1852.0882.2277.2277 0 01-.118-.031l-1.8892-1.113-1.908 1.1069a.2273.2273 0 01-.253-.0165c-.074-.0565-.1103-.1527-.093-.247l.4227-2.2372-1.5928-1.5546a.2554.2554 0 01-.0635-.258c.0287-.0916.1055-.1575.197-.1687l2.1618-.2708.9175-2.0679c.0385-.086.1206-.1412.2113-.1422.0918.0002.1752.0562.2137.1435l.9174 2.0703 2.162.2758c.0915.0116.1681.078.1963.17a.2552.2552 0 01-.0653.2579z' fill='currentColor' fillRule='nonzero'/></svg>",
    qualityTab: "<svg viewBox='0 0 27 26' style='width: 16px'><path d='M21.7517 8.2603l-1.315-1.5712a.6574.6574 0 01-.1457-.4646l.1578-2.0821c.0333-.5207-.2985-.9903-.7849-1.1108l-1.9462-.4646c-.1605-.0364-.2996-.1403-.3843-.2872L16.2894.5017c-.2636-.4437-.7974-.6211-1.2583-.4182L13.1942.903a.5854.5854 0 01-.4693 0l-1.849-.7982c-.4638-.1968-.9957-.0123-1.2544.435L8.598 2.3305c-.0862.1446-.2224.249-.3804.2914l-1.942.4857c-.4863.1239-.814.5985-.7729 1.1192l.178 2.078a.6522.6522 0 01-.1416.4688L4.2402 8.3574c-.3233.3997-.3199.9856.0081 1.3811l1.315 1.5712a.6574.6574 0 01.1457.4646l-.1578 2.0822c-.0345.521.2978.9913.7849 1.1107l1.9462.4646c.1599.038.2984.1415.3843.2872l1.044 1.7781c.2623.4454.7975.6232 1.2583.4182l1.8369-.8194a.5854.5854 0 01.4693 0l1.849.7982c.4638.1973.996.0127 1.2544-.435l1.0236-1.7908c.0853-.1446.222-.248.3804-.2871l.4976-.1268c.0081 0 .0162-.0042.0243-.0042l1.4202-.359c.4878-.1215.8166-.5977.7728-1.1192l-.178-2.078a.6522.6522 0 01.1416-.4688l1.2988-1.5838c.3233-.3997.3199-.9856-.0081-1.3811zM22 24.1329L19.4205 19c-.1266.4057-.383.7658-.735 1.0321-.5516.293-1.191.4092-1.8203.3311a3.6026 3.6026 0 00-1.052.0694 3.135 3.135 0 00-.8132.475L17.5626 26l1.25-2.2907c.0993-.1837.3234-.2772.5366-.2238L22 24.133zm-17 0L7.5795 19c.1266.4057.383.7658.735 1.0321.5516.293 1.191.4092 1.8203.3311a3.6026 3.6026 0 011.052.0694c.296.118.5703.2783.8132.475L9.4374 26l-1.25-2.2907c-.0993-.1837-.3234-.2772-.5366-.2238L5 24.133zM16.9234 8.9175l-1.5975 1.5496.4168 2.2385a.256.256 0 01-.051.2062.2318.2318 0 01-.1852.0882.2277.2277 0 01-.118-.031l-1.8892-1.113-1.908 1.1069a.2273.2273 0 01-.253-.0165c-.074-.0565-.1103-.1527-.093-.247l.4227-2.2372-1.5928-1.5546a.2554.2554 0 01-.0635-.258c.0287-.0916.1055-.1575.197-.1687l2.1618-.2708.9175-2.0679c.0385-.086.1206-.1412.2113-.1422.0918.0002.1752.0562.2137.1435l.9174 2.0703 2.162.2758c.0915.0116.1681.078.1963.17a.2552.2552 0 01-.0653.2579z' fill='currentColor' fillRule='nonzero'/></svg>",
    quickaccess: "<svg viewBox='0 0 29 36'><defs><filter id='a' x='-3.6%' y='-.7%' width='107.1%' height='101.5%' filterUnits='objectBoundingBox'><feOffset dx='1' in='SourceAlpha' result='shadowOffsetOuter1'/><feGaussianBlur stdDeviation='3' in='shadowOffsetOuter1' result='shadowBlurOuter1'/><feColorMatrix values='0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.15 0' in='shadowBlurOuter1' result='shadowMatrixOuter1'/><feMerge><feMergeNode in='shadowMatrixOuter1'/><feMergeNode in='SourceGraphic'/></feMerge></filter></defs><g filter='url(#a)' transform='translate(-37 -579)' fill='currentColor' fillRule='nonzero' fillOpacity='.8'><path d='M58.551 592v14c-.0026 2.6658-.2411 2.997-2.7584 3h-11.034c-2.4129-.0029-2.7559-.327-2.7586-3v-18c.0025-2.4725.9907-2.9979 2.7585-3h7.356v6c0 .5523.4117 1 .9196 1h5.517zm-3.7366 5.751a.3234.3234 0 00.0858-.3316c-.037-.1182-.1377-.2036-.258-.2185l-2.8398-.3546-1.205-2.6618a.3098.3098 0 00-.2808-.1845.3098.3098 0 00-.2776.1829l-1.2051 2.6586-2.8398.3482c-.12.0145-.221.0991-.2587.2169a.3235.3235 0 00.0834.3317l2.0923 1.9988-.5553 2.8765a.322.322 0 00.1222.3174.3038.3038 0 00.3323.0212l2.5063-1.423 2.4816 1.431a.3042.3042 0 00.155.0397.307.307 0 00.2432-.1133.3239.3239 0 00.067-.2651l-.5474-2.878 2.0984-1.9925zm-1.3524-12.7024v5.5267h5.099l-5.099-5.5267z'/></g></svg>",
    settings: "<svg viewBox='0 0 27 26'><path d='M23.2027 13.8195v-2.6312a7.5441 7.5441 0 001.6027-1.3195.7648.7648 0 00.0865-.9016l-2.569-4.419c-.1648-.2955-.5049-.452-.8407-.3869a7.668 7.668 0 00-1.9642.7004l-2.3176-1.3195a7.1764 7.1764 0 00-.3575-2.0237c-.1098-.3095-.4057-.5172-.7385-.5185H10.927c-.3388-.0003-.6396.2134-.7464.5301a7.1806 7.1806 0 00-.3653 2.0237L7.4977 4.8694a7.4927 7.4927 0 00-1.9642-.708c-.3313-.0688-.67.0794-.8406.3675L2.1081 8.9401a.7648.7648 0 00.0943.9016 7.5702 7.5702 0 001.5949 1.3233v2.6313a7.5441 7.5441 0 00-1.6027 1.3194.7648.7648 0 00-.0865.9016l2.569 4.419c.1648.2956.5049.452.8407.3869a7.668 7.668 0 001.9642-.7004l2.3176 1.3195a7.1764 7.1764 0 00.3575 2.0237c.1049.317.404.532.7424.534h5.1735c.3388.0003.6396-.2134.7464-.5301a7.1806 7.1806 0 00.3653-2.0237l2.3176-1.3156a7.4927 7.4927 0 001.9642.708c.3313.0688.67-.0794.8406-.3675l2.5848-4.4267a.7648.7648 0 00-.0943-.9016 7.5702 7.5702 0 00-1.5949-1.3233zm-6.6426.4179c-.9785 1.6642-3.1413 2.2321-4.8309 1.2684-1.6896-.9636-2.2663-3.094-1.2882-4.7584.9781-1.6645 3.1408-2.2328 4.8306-1.2694.8117.4627 1.4035 1.2242 1.6452 2.1168a3.437 3.437 0 01-.3567 2.6426z' fill='currentColor' fillRule='nonzero'/></svg>",
    notifications: "<svg viewBox='0 0 33 30' style='width: 30px'><path d='M14.6464 23.8h4.708c.0304.1684.0456.3437.0456.5214C19.4 25.8004 18.3255 27 17 27c-1.3264 0-2.4-1.1998-2.4-2.6786 0-.1777.0169-.353.0464-.5214zm.2268-18.4506c-.5032-3.0418 5.0513-3.222 4.4951 0 2.4071.8357 4.3394 2.7008 4.5754 5.6512.3117 3.914.068 8.0419 3.2899 9.9094.5173.299 1.0868.4244 1.7664.6956v1.394c-8.0246-.0017-16.2415.0015-24 0v-1.2382c2.0408-.8147 3.3528-1.7307 4.1735-3.5623 1.2309-2.7441.3473-7.2014 1.686-9.83.8282-1.6245 2.0781-2.5176 4.0137-3.0197z' fill='currentColor' fillRule='evenodd' fillOpacity='.3'/></svg>",
    andon: "<svg viewBox='0 0 29 28'><path d='M23.2058 6H5.7942C4.8036 6.0007 4.0008 6.7361 4 7.6435v11.713c.0008.9074.8036 1.6428 1.7942 1.6435h17.4116c.9906-.0007 1.7934-.7361 1.7942-1.6435V7.6435c-.0008-.9074-.8036-1.6428-1.7942-1.6435zm.0215 4v2.7273h-8V10h8zm-9.3182 2.7273h-8V10h8v2.7273zm-8 .68h8v2.7272h-8v-2.7272zm9.3182 0h8v2.7272h-8v-2.7272zm-9.3182 5.21v-1.8028h8v2.7273H7.205c-.7152-.0009-1.2947-.4143-1.296-.9245zm16.0221.9245h-6.704v-2.7273h8v1.8028c.0004.2452-.136.4806-.3791.654-.2432.1734-.573.2708-.9169.2705z' fill='currentColor' fillRule='nonzero' fillOpacity='.3'/></svg>",
    dashboard: "<svg viewBox='0 0 29 28'><path d='M14.4868 6c-3.5346.0024-6.8389 1.8783-8.8241 5.0096-1.9852 3.1314-2.394 7.112-1.0914 10.6304l.1334.36h19.5642l.1334-.36c1.3025-3.5184.8938-7.499-1.0914-10.6304C21.3256 7.8783 18.0214 6.0024 14.4868 6zm5.9833 8.563l-3.506 4.6614c.4818.545.75 1.2652.7496 2.0137h-1.1025c0-.9727-.7404-1.7612-1.6538-1.7612s-1.6538.7885-1.6538 1.7612h-1.1025c.0004-.9899.4694-1.9128 1.2472-2.4548s1.7597-.63 2.6116-.234l3.5282-4.6966c.1191-.1678.3133-.2551.5093-.2291.196.026.3641.1614.441.3551.0769.1938.0508.4166-.0683.5844zm1.8738 3.6275c-.2893 0-.5238-.261-.5238-.583-.0007-3.8637-2.4362-7.1975-5.835-7.987-3.3988-.7894-6.8293 1.1819-8.2188 4.7228-.4072 1.0284-.616 2.1404-.6128 3.2643 0 .3219-.2346.5829-.5239.5829-.2892 0-.5238-.261-.5238-.583-.0023-1.2843.2368-2.555.702-3.7306 1.589-4.0446 5.5085-6.2955 9.3915-5.3935 3.883.902 6.666 4.7099 6.6684 9.1242 0 .3219-.2345.5829-.5238.5829z' fill='currentColor' fillRule='nonzero' fillOpacity='.3'/></svg>",
    map: "<svg viewBox='0 0 29 28'><path d='M1 25l1.3727-11.7007 5.1949-2.058-.673 11.6714L1 25zm7.2973-2.058l.7864-11.7006 5.0514 2.0285V25l-5.8378-2.058zm10.9763-7.1835c.2129.4214.5778.7224 1.0034.903l.4257 6.2313L14.8649 25V12.989l2.4628-1.0235 1.946 3.793zm7.2827-2.8511L28 25l-6.1996-2.1572-.368-6.2894c.3964-.1519.736-.4861.9342-.9115a514.617 514.617 0 011.7551-3.6764l2.4346.9419zM23.9585 6.113c.519 1.118.519 2.357.0288 3.4448-.519 1.0878-2.7965 5.7111-2.7965 5.7111-.173.423-.7496.423-.9514 0 0 0-1.9028-3.898-2.7965-5.711-.8938-1.8131-.2018-4.1701 1.6145-5.137 1.7874-.967 3.9785-.2116 4.901 1.6921zm-3.2578 3.6261c.9514 0 1.7298-.8159 1.7298-1.813 0-.9972-.7784-1.813-1.7298-1.813s-1.7298.8158-1.7298 1.813c0 .9971.7784 1.813 1.7298 1.813z' fill='currentColor' fillRule='nonzero' fillOpacity='.3'/></svg>",
    powerbi: "<svg viewBox='0 0 29 28'><path d='M22.4527 21.2478h-1.306V6.1938c0-.1817-.1417-.3286-.3163-.3286h-3.5066c-.1746 0-.3164.147-.3164.3285v15.0541h-.703v-6.2385c0-.1814-.1417-.3286-.3163-.3286h-3.5065c-.1749 0-.3164.1472-.3164.3286v6.2385h-.703V9.6433c0-.1816-.1415-.3286-.3163-.3286H7.6397c-.1748 0-.3163.147-.3163.3286v11.6045h-.6361V4.8761c0-.4838-.3778-.8761-.8437-.8761S5 4.3923 5 4.876v17.248c0 .4837.3777.876.8436.876h16.609c.466 0 .8437-.3923.8437-.876 0-.4839-.3777-.8762-.8436-.8762z' fill='currentColor' fillRule='nonzero' fillOpacity='.3'/></svg>",
    edit: "<svg viewBox='0 0 45 45'><path d='M33.0429.7071L28.832 4.918c-.3905.3905-.3905 1.0237 0 1.4142l9.8358 9.8358c.3905.3905 1.0237.3905 1.4142 0l4.2108-4.2108c.3905-.3905.3905-1.0237 0-1.4142L34.457.707c-.3905-.3905-1.0237-.3905-1.4142 0zm-11.25 11.25l-21.5 21.5A1 1 0 000 34.1642V44c0 .5523.4477 1 1 1h10.25l21.7929-21.7929c.3905-.3905.3905-1.0237 0-1.4142L23.207 11.957c-.3905-.3905-1.0237-.3905-1.4142 0z' fill='currentColor' fillRule='nonzero'/></svg>",
    reports: "<svg viewBox='0 0 29 28'><path d='M21.4222 3H7.3778C6.6222 3 6 3.619 6 4.3705v18.259C6 23.381 6.6222 24 7.3778 24h14.0444c.7556 0 1.3778-.619 1.3778-1.3705V4.3705C22.8 3.619 22.1778 3 21.4222 3zm-4.5747 14.76h-6.3118c-.1846 0-.3357-.315-.3357-.7 0-.385.151-.7.3357-.7h6.3286c.1846 0 .3357.315.3357.7 0 .385-.1679.7-.3525.7zm2.1272-3.36h-8.3315c-.2438 0-.4432-.315-.4432-.7 0-.385.1994-.7.4432-.7h8.3536c.2438 0 .4432.315.4432.7 0 .385-.2216.7-.4653.7zm0-3h-8.3315c-.2438 0-.4432-.315-.4432-.7 0-.385.1994-.7.4432-.7h8.3536c.2438 0 .4432.315.4432.7 0 .385-.2216.7-.4653.7z' fill='currentColor' fillRule='nonzero' fillOpacity='.3'/></svg>",
    help: "<svg viewBox='0 96 960 960'><path d='M473.5 810q18.5 0 32.5-14t14-32.5q0-18.5-13.92-32T473 718q-18 0-31.5 13.42T428 764q0 18 13.5 32t32 14ZM433 662h72q0-26 9-47.717 9-21.716 37-47.283 25-26 38.5-51.777t13.5-57.854Q603 400 567 369t-91-31q-55.167 0-93.083 30Q345 398 327 442l69 28q14-24 31.9-40.5T475 413q26 0 40 13.829 14 13.828 14 35.2Q529 480 518 496.5 507 513 491 529q-40 39-49 63t-9 70ZM189 961q-39.05 0-66.525-27.475Q95 906.05 95 867V285q0-39.463 27.475-67.231Q149.95 190 189 190h582q39.463 0 67.231 27.769Q866 245.537 866 285v582q0 39.05-27.769 66.525Q810.463 961 771 961H189Z'/></svg>",
    release: "<svg viewBox='45 45 45 45'><path d='M80 33.33 56.667 9.997V33.33z'/><path d='M50 33.33V9.997H26.667A6.664 6.664 0 0 0 20 16.66v66.67a6.664 6.664 0 0 0 6.667 6.666l46.666.008A6.671 6.671 0 0 0 80 83.336V39.997H56.667A6.67 6.67 0 0 1 50 33.33z'/></svg>",
    logistics: "<svg height='1em' viewBox='0 0 576 512'><path d='M0 32C0 14.3 14.3 0 32 0h72.9c27.5 0 52 17.6 60.7 43.8L257.7 320c30.1 .5 56.8 14.9 74 37l202.1-67.4c16.8-5.6 34.9 3.5 40.5 20.2s-3.5 34.9-20.2 40.5L352 417.7c-.9 52.2-43.5 94.3-96 94.3c-53 0-96-43-96-96c0-30.8 14.5-58.2 37-75.8L104.9 64H32C14.3 64 0 49.7 0 32zM244.8 134.5c-5.5-16.8 3.7-34.9 20.5-40.3L311 79.4l19.8 60.9 60.9-19.8L371.8 59.6l45.7-14.8c16.8-5.5 34.9 3.7 40.3 20.5l49.4 152.2c5.5 16.8-3.7 34.9-20.5 40.3L334.5 307.2c-16.8 5.5-34.9-3.7-40.3-20.5L244.8 134.5z' fill='currentColor' fillRule='nonzero' fillOpacity='.3'/></svg>",
    logTab: "<svg height='1em' viewBox='0 0 576 512'><path d='M0 32C0 14.3 14.3 0 32 0h72.9c27.5 0 52 17.6 60.7 43.8L257.7 320c30.1 .5 56.8 14.9 74 37l202.1-67.4c16.8-5.6 34.9 3.5 40.5 20.2s-3.5 34.9-20.2 40.5L352 417.7c-.9 52.2-43.5 94.3-96 94.3c-53 0-96-43-96-96c0-30.8 14.5-58.2 37-75.8L104.9 64H32C14.3 64 0 49.7 0 32zM244.8 134.5c-5.5-16.8 3.7-34.9 20.5-40.3L311 79.4l19.8 60.9 60.9-19.8L371.8 59.6l45.7-14.8c16.8-5.5 34.9 3.7 40.3 20.5l49.4 152.2c5.5 16.8-3.7 34.9-20.5 40.3L334.5 307.2c-16.8 5.5-34.9-3.7-40.3-20.5L244.8 134.5z' fill='currentColor' fillRule='nonzero' fillOpacity='.3'/></svg>", 
    suggestion: "<svg height='1em' viewBox='0 0 512 512'><path d='M64 0C28.7 0 0 28.7 0 64V352c0 35.3 28.7 64 64 64h96v80c0 6.1 3.4 11.6 8.8 14.3s11.9 2.1 16.8-1.5L309.3 416H448c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64H64z'/></svg>",
    rocket: "<svg viewBox='0 0 512 512'><path d='M156.6 384.9L125.7 354c-8.5-8.5-11.5-20.8-7.7-32.2c3-8.9 7-20.5 11.8-33.8L24 288c-8.6 0-16.6-4.6-20.9-12.1s-4.2-16.7 .2-24.1l52.5-88.5c13-21.9 36.5-35.3 61.9-35.3l82.3 0c2.4-4 4.8-7.7 7.2-11.3C289.1-4.1 411.1-8.1 483.9 5.3c11.6 2.1 20.6 11.2 22.8 22.8c13.4 72.9 9.3 194.8-111.4 276.7c-3.5 2.4-7.3 4.8-11.3 7.2v82.3c0 25.4-13.4 49-35.3 61.9l-88.5 52.5c-7.4 4.4-16.6 4.5-24.1 .2s-12.1-12.2-12.1-20.9V380.8c-14.1 4.9-26.4 8.9-35.7 11.9c-11.2 3.6-23.4 .5-31.8-7.8zM384 168a40 40 0 1 0 0-80 40 40 0 1 0 0 80z'/></svg>"
  }

  @Input() name: string;
  @Input() color: string;
  @Input() size: string;

  constructor(private sanitizer: DomSanitizer) { }

  icon = (icon) => {
    return this.sanitizer.bypassSecurityTrustHtml(this.PPIIcons[icon])
  }

}

