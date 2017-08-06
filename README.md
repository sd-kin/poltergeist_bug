# README

Repository for reproduce error with poltergeist adapter and js arrow function. When you have form with `remote: true` and add some js function, which have code like that - `objects.forEach(object => doSomethingWith(object))` (just have it somewhere, no even need to call it) and submit such form in feature test then you get an error
```
ActionController::UnknownFormat:
       BaseController#create is missing a template for this request format and variant.

       request.formats: ["text/html"]
       request.variant: []
```

But if you use standard function declaration instead, like `objects.forEach( function(object) { doSomethingWith(object) } )` all works fine.

Looks like rails UJS staff never loaded in first scenario and it leads to `remote: true` have no effect on form.

Branch 'working' shows how it works, brunch 'broken' - how it not.
To see the problem run `rspec spec/features/submit.rb`.

Ruby version - `ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]`, system `ubuntu-trusty-64` on vagrant VM
