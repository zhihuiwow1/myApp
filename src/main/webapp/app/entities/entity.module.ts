import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';

import { AppBookModule } from './book/book.module';
import { AppCarModule } from './car/car.module';
/* jhipster-needle-add-entity-module-import - JHipster will add entity modules imports here */

@NgModule({
    imports: [
        AppBookModule,
        AppCarModule,
        /* jhipster-needle-add-entity-module - JHipster will add entity modules here */
    ],
    declarations: [],
    entryComponents: [],
    providers: [],
    schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppEntityModule {}
