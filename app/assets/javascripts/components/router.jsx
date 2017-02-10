var Route = ReactRouter.Route;

this.MyRoutes = (
  <Route handler={App}>
    <Route name='home' handler={App} path='/' />
  </Route>
);

ReactRouter.run(MyRoutes);