import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PpiSubmenuComponent } from './submenu.component';

describe('PpiSubmenuComponent', () => {
  let component: PpiSubmenuComponent;
  let fixture: ComponentFixture<PpiSubmenuComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PpiSubmenuComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PpiSubmenuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
