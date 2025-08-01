import { Routes } from '@angular/router';

const Routing: Routes = [
  {
    path: 'dashboard',
    loadChildren: () => import('./dashboard/dashboard.module').then((m) => m.DashboardModule),
  },
  {
    path: 'builder',
    loadChildren: () => import('./builder/builder.module').then((m) => m.BuilderModule),
  },
  {
    path: 'crafted/pages/profile',
    loadChildren: () => import('../modules/profile/profile.module').then((m) => m.ProfileModule),
    // data: { layout: 'light-sidebar' },
  },
  {
    path: 'crafted/account',
    loadChildren: () => import('../modules/account/account.module').then((m) => m.AccountModule),
    // data: { layout: 'dark-header' },
  },
  {
    path: 'crafted/pages/wizards',
    loadChildren: () => import('../modules/wizards/wizards.module').then((m) => m.WizardsModule),
    // data: { layout: 'light-header' },
  },
  {
    path: 'crafted/widgets',
    loadChildren: () => import('../modules/widgets-examples/widgets-examples.module').then((m) => m.WidgetsExamplesModule),
    // data: { layout: 'light-header' },
  },
  {
    path: 'apps/chat',
    loadChildren: () => import('../modules/apps/chat/chat.module').then((m) => m.ChatModule),
    // data: { layout: 'light-sidebar' },
  },
  {
    path: 'apps/users',
    loadChildren: () => import('./user/user.module').then((m) => m.UserModule),
  },
  {
    path: 'apps/roles',
    loadChildren: () => import('./role/role.module').then((m) => m.RoleModule),
  },
  {
    path: 'apps/permissions',
    loadChildren: () => import('./permission/permission.module').then((m) => m.PermissionModule),
  },
  {
    path: '',
    redirectTo: '/dashboard',
    pathMatch: 'full',
  },
  {
    path: '**',
    redirectTo: 'error/404',
  },

  //Nuestros modulos

  {
    path: 'categories',
    loadChildren: () => import('../modules/categories/categories.module').then((m) => m.CategoriesModule),
  },
  {
    path: 'attributes',
    loadChildren: () => import('../modules/attributes/attributes.module').then((m) => m.AttributesModule),
  },
  {
    path: 'sliders',
    loadChildren: () => import('../modules/sliders/sliders.module').then((m) => m.SlidersModule),
  },
  {
    path: 'products',
    loadChildren: () => import('../modules/products/products.module').then((m) => m.ProductsModule),
  },
  {
    path: 'brands',
    loadChildren: () => import('../modules/brands/brands.module').then((m) => m.BrandsModule),
  },
  {
    path: 'cupones',
    loadChildren: () => import('../modules/cupones/cupones.module').then((m) => m.CuponesModule),
  },
  {
    path: 'discount',
    loadChildren: () => import('../modules/discount/discount.module').then((m) => m.DiscountModule),
  },
  {
    path: 'sales',
    loadChildren: () => import('../modules/sales/sales.module').then((m) => m.SalesModule),
  }, 
];

export { Routing };
