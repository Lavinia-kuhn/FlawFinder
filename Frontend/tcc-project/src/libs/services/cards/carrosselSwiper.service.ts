import { Injectable } from '@angular/core';

@Injectable({
    providedIn: 'root'
})
export class CarrosselSwiperService {

    private timerCarrossel: number = 3000;

    constructor() { }

    getSwiperConfig(label: string,): any {
        const baseConfig = {
            direction: 'horizontal',
            grid: {
                rows: 1,
                fill: 'row',
            },
            slidesPerView: 1,
            slidesPerColumn: 1,
            spaceBetween: 0,
            freeMode: true,
            observer: true,
            observeParents: true,
            autoplay: {
                delay: this.timerCarrossel,
                disableOnInteraction: false,
            },
        };
        switch (label) {
            case 'INDICATORCARD8X3':
            case 'INDICATORCARD8X3DET':
            case 'ADDRESSBALANCE':
                return {
                    ...baseConfig,
                    direction: 'horizontal',
                    grid: {
                        rows: 3,
                        fill: 'row',
                    },
                    slidesPerView: 8,
                    slidesPerColumn: 3,
                    spaceBetween: 0,
                    freeMode: true,
                    observeParents: true,
                    observer: true,


                    autoplay: {
                        delay: this.timerCarrossel,
                        disableOnInteraction: false,
                    },

                };
            case 'INDICATORCARD3X2':
                return {
                    ...baseConfig,
                    slidesPerColumn: 2,
                    slidesPerView: 3,
                    spaceBetween: 0,
                    grid: {
                        rows: 2,
                        fill: 'row',
                    },
                };
            case 'INDICATORCARD2X2':
                return {
                    ...baseConfig,
                    slidesPerColumn: 2,
                    slidesPerView: 2,
                    spaceBetween: 0,
                    grid: {
                        rows: 2,
                        fill: 'row',
                    },
                };
            default:
                return baseConfig;
        }
    }


}
