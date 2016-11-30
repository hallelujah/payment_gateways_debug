# Concern

Trying to debug payment gateways issues
# Instructions

1. Update braintree.yml file and fill in the provider credentials
2. Launch a console with `ruby braintree.rb`
3. When in the consolse, create an instance of BraintreeDebug `braintree = BraintreeDebug.new`
4. Search for the customer ID with: `profile = braintree.get_customer_profile ${CUSTOMER_ID}`
5. If customer found try to get the information you want either

If the Customer is not found you can use the `#search` method:

```
collection = braintree.search {|s| s.first_name.is 'Brendan' }
  #=>  #<Braintree::ResourceCollection:0x007feec0b5a908 @ids=["285308300"], @page_size=50, @paging_block=#<Proc:0x007feec0b5a818@/Users/hery/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/gems/braintree-2.10.3/lib/braintree/customer_gateway.rb:48>>
```

You can refine your search using [Braintree::Customer API reference](https://developers.braintreepayments.com/reference/request/customer/search/ruby)


Once you have your customer found in Braintree database, you then can update your own database

Based on the example above, we found a Braintree ID: 285308300


```
profile = braintree.get_customer_profile 285308300`

  #=> #<Braintree::Customer id: "285308300", addresses: [ ..] ..., credit_cards: [ #<Braintree::CreditCard token: "Awv0i6j", ...>] >


profile.credit_cards.first.token
  # => Awv0i6j
```
