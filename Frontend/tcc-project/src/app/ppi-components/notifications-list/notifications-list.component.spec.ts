import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PpiNotificationsListComponent } from './notifications-list.component';

describe('NotificationsListComponent', () => {
  let component: PpiNotificationsListComponent;
  let fixture: ComponentFixture<PpiNotificationsListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PpiNotificationsListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PpiNotificationsListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
