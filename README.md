[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/roberto/air-conditioning-system-tbjr) [![Build Status](https://secure.travis-ci.org/roberto/air-conditioning-system-tbjr.png)](http://travis-ci.org/roberto/air-conditioning-system-tbjr)

Sistema de controle de condicionador de ar da ACME.

Para executar a simulação:

```
git clone git@github.com:roberto/air-conditioning-system-tbjr.git
cd air-conditioning-system-tbjr
./configure
make
```

Após isso, para rodar os testes:

```
bundle install
bundle exec rake
```

Utilize `bundle install --without mac` caso não esteja utilizando MacOSX.

Para cobertura de testes:

```
coverage=ON bundle exec rake
open coverage/index.html
```
