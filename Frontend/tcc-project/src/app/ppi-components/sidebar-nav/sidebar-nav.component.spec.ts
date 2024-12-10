import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PpiSidebarNavComponent } from './sidebar-nav.component';

describe('PpiSidebarNavComponent', () => {
  let component: PpiSidebarNavComponent;
  let fixture: ComponentFixture<PpiSidebarNavComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PpiSidebarNavComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PpiSidebarNavComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
