# README - Rales Engine

This project is the joint work of [Ricky Amparo](https://github.com/rickyamparo) and [Brandon Stewart](https://github.com/boveus).  This project was part of our curriculum at the [Turing School of Software and Design](https://turing.io).  The primary learning goal in this project was to implement a RESTful API using Ruby on Rails.  We also covered topics related to implementing advanced Active Record queries, implementing filters and serializers, and building single-responsibility controllers.  We used Travis CI to manage our workflow throughout the project.

**Note: the CSV files used as a source for this project are not included in this repository, but they can be downloaded [here](https://github.com/turingschool-examples/sales_engine/tree/master/data). These files must be saved in the db/data directory in order to be used to populate the data from the server.**

Instructions for Implementing Rales Engine:

Run a bundle command to install all of the required gemfiles
```ruby
bundle
```
Once the bundle has successfully executed, set up the PostgreSQL database, load its schema, and populate it with data with the following rake commands.

```ruby
rake db:create
rake db:migrate
rake pop:all
```

To launch the server and interact wit the application, run the following command in the terminal

```ruby
rails s
```
You can visit any of the routes in our application and view them from your browser by navigating to localhost:3000. 
To view the JSON in a human readable way, it is recommended that you download a Google chrome plugin, or alternatively, view the JSON endpoints in Firefox, which makes JSON human readable by default.

A full listing of the routes in our application can be found below:

</head>
<body>

<h2>
  Routes
</h2>

<p>
  Routes match in priority from top to bottom
</p>


<table id='route_table' class='route_table'>
  <thead>
    <tr>
      <th>Helper</th>
      <th>HTTP Verb</th>
      <th>Path</th>
      <th>Controller#Action</th>
    </tr>
    <tr class='bottom'>
      <th>        <a data-route-helper="_path" title="Returns a relative path (without the http or domain)" href="#">Path</a> /
        <a data-route-helper="_url" title="Returns an absolute url (with the http and domain)" href="#">Url</a>
      </th>
      <th>      </th>
      <th>        <input id="search" placeholder="Path Match" type="search" name="path[]" />
      </th>
      <th>      </th>
    </tr>
  </thead>
  <tbody class='exact_matches' id='exact_matches'>
  </tbody>
  <tbody class='fuzzy_matches' id='fuzzy_matches'>
  </tbody>
  <tbody>
    <tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchants_most_revenue_index'>
      api_v1_merchants_most_revenue_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/most_revenue(.:format)'>
    /api/v1/merchants/most_revenue(.:format)
  </td>
  <td>
    <p>api/v1/merchants/most_revenue#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchants_revenue_index'>
      api_v1_merchants_revenue_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/revenue(.:format)'>
    /api/v1/merchants/revenue(.:format)
  </td>
  <td>
    <p>api/v1/merchants/revenue#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchants_find_index'>
      api_v1_merchants_find_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/find(.:format)'>
    /api/v1/merchants/find(.:format)
  </td>
  <td>
    <p>api/v1/merchants/find#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchants_find_all_index'>
      api_v1_merchants_find_all_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/find_all(.:format)'>
    /api/v1/merchants/find_all(.:format)
  </td>
  <td>
    <p>api/v1/merchants/find_all#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchants_most_items'>
      api_v1_merchants_most_items<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/most_items(.:format)'>
    /api/v1/merchants/most_items(.:format)
  </td>
  <td>
    <p>api/v1/merchants/most_items#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoices_find_index'>
      api_v1_invoices_find_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices/find(.:format)'>
    /api/v1/invoices/find(.:format)
  </td>
  <td>
    <p>api/v1/invoices/find#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoices_find_all_index'>
      api_v1_invoices_find_all_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices/find_all(.:format)'>
    /api/v1/invoices/find_all(.:format)
  </td>
  <td>
    <p>api/v1/invoices/find_all#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_customers_find_index'>
      api_v1_customers_find_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/customers/find(.:format)'>
    /api/v1/customers/find(.:format)
  </td>
  <td>
    <p>api/v1/customers/find#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_customers_find_all_index'>
      api_v1_customers_find_all_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/customers/find_all(.:format)'>
    /api/v1/customers/find_all(.:format)
  </td>
  <td>
    <p>api/v1/customers/find_all#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_customer_favorite_merchant_index'>
      api_v1_customer_favorite_merchant_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/customers/:customer_id/favorite_merchant(.:format)'>
    /api/v1/customers/:customer_id/favorite_merchant(.:format)
  </td>
  <td>
    <p>api/v1/favorite_merchant#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_customers'>
      api_v1_customers<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/customers(.:format)'>
    /api/v1/customers(.:format)
  </td>
  <td>
    <p>api/v1/customers#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_customer'>
      api_v1_customer<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/customers/:id(.:format)'>
    /api/v1/customers/:id(.:format)
  </td>
  <td>
    <p>api/v1/customers#show</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice_transactions'>
      api_v1_invoice_transactions<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices/:invoice_id/transactions(.:format)'>
    /api/v1/invoices/:invoice_id/transactions(.:format)
  </td>
  <td>
    <p>api/v1/invoices/transactions#index {:to=&gt;"invoices/transactions#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice_merchant_index'>
      api_v1_invoice_merchant_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices/:invoice_id/merchant(.:format)'>
    /api/v1/invoices/:invoice_id/merchant(.:format)
  </td>
  <td>
    <p>api/v1/invoices/merchant#index {:to=&gt;"invoices/merchant#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice_items'>
      api_v1_invoice_items<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices/:invoice_id/items(.:format)'>
    /api/v1/invoices/:invoice_id/items(.:format)
  </td>
  <td>
    <p>api/v1/invoices/items#index {:to=&gt;"invoices/items#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice_customer_index'>
      api_v1_invoice_customer_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices/:invoice_id/customer(.:format)'>
    /api/v1/invoices/:invoice_id/customer(.:format)
  </td>
  <td>
    <p>api/v1/invoices/customer#index {:to=&gt;"invoices/customer#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice_invoice_items'>
      api_v1_invoice_invoice_items<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices/:invoice_id/invoice_items(.:format)'>
    /api/v1/invoices/:invoice_id/invoice_items(.:format)
  </td>
  <td>
    <p>api/v1/invoices/invoice_items#index {:to=&gt;"invoices/invoice_items#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoices'>
      api_v1_invoices<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices(.:format)'>
    /api/v1/invoices(.:format)
  </td>
  <td>
    <p>api/v1/invoices#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice'>
      api_v1_invoice<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoices/:id(.:format)'>
    /api/v1/invoices/:id(.:format)
  </td>
  <td>
    <p>api/v1/invoices#show</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchant_items'>
      api_v1_merchant_items<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/:merchant_id/items(.:format)'>
    /api/v1/merchants/:merchant_id/items(.:format)
  </td>
  <td>
    <p>api/v1/merchants/items#index {:to=&gt;"merchants/items#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchant_invoices'>
      api_v1_merchant_invoices<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/:merchant_id/invoices(.:format)'>
    /api/v1/merchants/:merchant_id/invoices(.:format)
  </td>
  <td>
    <p>api/v1/merchants/invoices#index {:to=&gt;"merchants/invoices#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchant_revenue_index'>
      api_v1_merchant_revenue_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/:merchant_id/revenue(.:format)'>
    /api/v1/merchants/:merchant_id/revenue(.:format)
  </td>
  <td>
    <p>api/v1/revenue#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchant_favorite_customer_index'>
      api_v1_merchant_favorite_customer_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/:merchant_id/favorite_customer(.:format)'>
    /api/v1/merchants/:merchant_id/favorite_customer(.:format)
  </td>
  <td>
    <p>api/v1/favorite_customer#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchants'>
      api_v1_merchants<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants(.:format)'>
    /api/v1/merchants(.:format)
  </td>
  <td>
    <p>api/v1/merchants#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_merchant'>
      api_v1_merchant<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/merchants/:id(.:format)'>
    /api/v1/merchants/:id(.:format)
  </td>
  <td>
    <p>api/v1/merchants#show</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_items_find_index'>
      api_v1_items_find_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items/find(.:format)'>
    /api/v1/items/find(.:format)
  </td>
  <td>
    <p>api/v1/items/find#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_items_find_all_index'>
      api_v1_items_find_all_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items/find_all(.:format)'>
    /api/v1/items/find_all(.:format)
  </td>
  <td>
    <p>api/v1/items/find_all#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_items_most_revenue_index'>
      api_v1_items_most_revenue_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items/most_revenue(.:format)'>
    /api/v1/items/most_revenue(.:format)
  </td>
  <td>
    <p>api/v1/items/most_revenue#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_items_most_items'>
      api_v1_items_most_items<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items/most_items(.:format)'>
    /api/v1/items/most_items(.:format)
  </td>
  <td>
    <p>api/v1/items/most_items#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_item_invoice_items'>
      api_v1_item_invoice_items<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items/:item_id/invoice_items(.:format)'>
    /api/v1/items/:item_id/invoice_items(.:format)
  </td>
  <td>
    <p>api/v1/items/invoice_items#index {:to=&gt;"items/invoice_items#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_item_merchant_index'>
      api_v1_item_merchant_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items/:item_id/merchant(.:format)'>
    /api/v1/items/:item_id/merchant(.:format)
  </td>
  <td>
    <p>api/v1/items/merchant#index {:to=&gt;"items/merchant#index"}</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_item_best_day_index'>
      api_v1_item_best_day_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items/:item_id/best_day(.:format)'>
    /api/v1/items/:item_id/best_day(.:format)
  </td>
  <td>
    <p>api/v1/best_day#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_items'>
      api_v1_items<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items(.:format)'>
    /api/v1/items(.:format)
  </td>
  <td>
    <p>api/v1/items#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_item'>
      api_v1_item<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/items/:id(.:format)'>
    /api/v1/items/:id(.:format)
  </td>
  <td>
    <p>api/v1/items#show</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_transactions_find_index'>
      api_v1_transactions_find_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/transactions/find(.:format)'>
    /api/v1/transactions/find(.:format)
  </td>
  <td>
    <p>api/v1/transactions/find#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_transactions_find_all_index'>
      api_v1_transactions_find_all_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/transactions/find_all(.:format)'>
    /api/v1/transactions/find_all(.:format)
  </td>
  <td>
    <p>api/v1/transactions/find_all#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_transactions'>
      api_v1_transactions<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/transactions(.:format)'>
    /api/v1/transactions(.:format)
  </td>
  <td>
    <p>api/v1/transactions#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_transaction'>
      api_v1_transaction<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/transactions/:id(.:format)'>
    /api/v1/transactions/:id(.:format)
  </td>
  <td>
    <p>api/v1/transactions#show</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice_items_find_index'>
      api_v1_invoice_items_find_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoice_items/find(.:format)'>
    /api/v1/invoice_items/find(.:format)
  </td>
  <td>
    <p>api/v1/invoice_items/find#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice_items_find_all_index'>
      api_v1_invoice_items_find_all_index<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoice_items/find_all(.:format)'>
    /api/v1/invoice_items/find_all(.:format)
  </td>
  <td>
    <p>api/v1/invoice_items/find_all#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name=''>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoice_items(.:format)'>
    /api/v1/invoice_items(.:format)
  </td>
  <td>
    <p>api/v1/invoice_items#index</p>
  </td>
</tr>
<tr class='route_row' data-helper='path'>
  <td data-route-name='api_v1_invoice_item'>
      api_v1_invoice_item<span class='helper'>_path</span>
  </td>
  <td>
    GET
  </td>
  <td data-route-path='/api/v1/invoice_items/:id(.:format)'>
    /api/v1/invoice_items/:id(.:format)
  </td>
  <td>
    <p>api/v1/invoice_items#show</p>
  </td>
</tr>

  </tbody>
</table>
