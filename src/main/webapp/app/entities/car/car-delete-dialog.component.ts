import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { NgbActiveModal } from '@ng-bootstrap/ng-bootstrap';
import { JhiEventManager } from 'ng-jhipster';

import { Car } from './car.model';
import { CarPopupService } from './car-popup.service';
import { CarService } from './car.service';

@Component({
    selector: 'jhi-car-delete-dialog',
    templateUrl: './car-delete-dialog.component.html'
})
export class CarDeleteDialogComponent {

    car: Car;

    constructor(
        private carService: CarService,
        public activeModal: NgbActiveModal,
        private eventManager: JhiEventManager
    ) {
    }

    clear() {
        this.activeModal.dismiss('cancel');
    }

    confirmDelete(id: number) {
        this.carService.delete(id).subscribe((response) => {
            this.eventManager.broadcast({
                name: 'carListModification',
                content: 'Deleted an car'
            });
            this.activeModal.dismiss(true);
        });
    }
}

@Component({
    selector: 'jhi-car-delete-popup',
    template: ''
})
export class CarDeletePopupComponent implements OnInit, OnDestroy {

    routeSub: any;

    constructor(
        private route: ActivatedRoute,
        private carPopupService: CarPopupService
    ) {}

    ngOnInit() {
        this.routeSub = this.route.params.subscribe((params) => {
            this.carPopupService
                .open(CarDeleteDialogComponent as Component, params['id']);
        });
    }

    ngOnDestroy() {
        this.routeSub.unsubscribe();
    }
}
