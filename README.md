# OnlineJudge Front End

[![vue](https://camo.githubusercontent.com/c667f80f30b4d9182bf2b261c0de61306e3be5c2/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f7675652d322e352e31332d626c75652e7376673f7374796c653d666c61742d737175617265)](https://github.com/vuejs/vue)
[![vuex](https://camo.githubusercontent.com/e9f884d9129ecc11bbf1eb004e6cec42810a2540/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f767565782d332e302e312d626c75652e7376673f7374796c653d666c61742d737175617265)](https://vuex.vuejs.org/)
[![echarts](https://camo.githubusercontent.com/8ce4e001d81b8f99c176cb24a14fe94151ddb534/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f656368617274732d332e382e332d626c75652e7376673f7374796c653d666c61742d737175617265)](https://github.com/ecomfe/echarts)
[![iview](https://camo.githubusercontent.com/1dabb93bc4102799f32d5211d9124a511dc3ab07/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f69766965772d322e382e302d626c75652e7376673f7374796c653d666c61742d737175617265)](https://github.com/iview/iview)
[![element-ui](https://camo.githubusercontent.com/6fea63b0615ca60365c32f26018917ea492e4fdd/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f656c656d656e742d322e302e392d626c75652e7376673f7374796c653d666c61742d737175617265)](https://github.com/ElemeFE/element)

> ### A multiple pages app built for OnlineJudge. [Demo](https://oj.yangzheng.com.cn/)

Fork from [QingdaoU/OnlineJudgeFE](https://github.com/QingdaoU/OnlineJudgeFE)

## Features

- Webpack3 multiple pages with bundle size optimization
- Easy use simditor & Nice codemirror editor
- Amazing charting and visualization(echarts)
- User-friendly operation
- Quite beautiful：)

## Get Started

### Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### NodeJS

Install Node.JS **v12.16.1** first

```
npm install
# we use webpack DllReference to decrease the build time,
# this command only needs execute once unless you upgrade the package in build/webpack.dll.conf.js
set NODE_ENV=development
npm run build:dll
# Small language fixed
cp node_modules/echarts/lib/langEN.js node_modules/echarts/lib/lang.js 
# the dev-server will set proxy table to your backend
set TARGET=0.0.0.0

# serve with hot reload at localhost:8080
npm run dev
```

### Docker

```
# build image
docker build -t OJ_FE .

# run container
docker run -td -e PORT=6080 -p 6080:6080 OJ_FE
```

## Screenshots

[Check here.](https://github.com/QingdaoU/OnlineJudge)

## LICENSE

[MIT](http://opensource.org/licenses/MIT)

## Attention

```
#custom JavaScript or CSS
./src/styles

#page
./src/pages

#language
./src/i18n
```
