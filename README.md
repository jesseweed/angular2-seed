# Angular 2 Seed
Bootstrap Angular 2 apps with Jade + Stylus.

_[WIP]_

*****

## Gulp Process

#### Build files & launch server
```
$ gulp serve
```

**launch browser: ** [http://localhost:1981](http://localhost:1981)

_Or_ if you don't want to run the server & simply want to your source files to the build directory:

#### Compile all our source files & output to `build` directory
```
$ gulp serve
```

*****

## Using Jade Templates
Swapping out inline templates for Jade templates is super easy. For example, suppose you're following the "Hero" demo app, open up your `app/app.component.ts` file, and replace this:
```
@Component({
  selector: 'my-app',
  template: '
  <h1>{{title}}</h1>
  <h2>{{hero.name}} details!</h2>
  <div><label>id: </label>{{hero.id}}</div>
  <div><label>name: </label>{{hero.name}}</div>
  '
})
```

with something like this:

```
@Component({
  selector: 'my-app',
  templateUrl: 'app/hero.html'
})
```

Next create `app/hero.jade`, and add the following:
```
h1 {{title}}
h2 {{hero.name}} details!
div
  label id:
  | {{hero.id}}
div
  label name:
  | {{hero.name}}
```

and voila! You've just replaced inline templates with Jade templates.

**note:** the `hero.jade` file will will be compiled to `hero.html`, which is why you link to the .html file and not the .jade file.


*****

## Using Stylus
You can add .styl files to `app/css` and it will compile everything from the root `app/css/` (it will not be default watch subdirectories as it's assumed these will be includes that you include from files in the root directory).

It will also watch for .styl files and they will be compiled & saved to `_build` dir following the same structure. For example, `app/foo/bar.styl` will end up as `_build/app/foo/bar.css`


*****

## Component System
This setup makes it really simple to componentize your files. You can use it to easily do something like this:

```
app
  my-component
    my-component.jade
    my-component.styl
    my-component.ts
```

and will give you

```
_build
  app
    my-component
      my-component.css
      my-component.html
      my-component.js
```
