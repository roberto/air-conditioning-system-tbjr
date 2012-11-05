[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/roberto/air-conditioning-system-tbjr) [![Build Status](https://secure.travis-ci.org/roberto/air-conditioning-system-tbjr.png)](http://travis-ci.org/roberto/air-conditioning-system-tbjr)

Sistema de controle de condicionador de ar da ACME.

Para executar a simulação:

```
git clone git://github.com/roberto/air-conditioning-system-tbjr.git
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

## Observações

A principal parte da solução está em `Regulador`, mais especificamente em `#refrigera`. As outras classes são apenas para simular o Ar Condicionado.

Na definição temos:

> O hardware do ar-condicionado possui uma função que você pode chamar que é: `reduz_um_grau()`

Então criei `Hardware::reduz_um_grau` apenas para simular o Hardware que supostamente não seria implementado por mim, mas seria usado por `Regulador` em, podemos assim dizer, produção.

Já `Simulador` faz o papel do Ar Condicionado chamando `#refrigera` com os parametros corretos (temperatura atual e temperatura desejada), durante o tempo estabelecido, enquanto aumenta a temperatura.

> Os argumentos temp_atual e temp_desejada serão passados pra você pelo ar-condicionado.

Solução em português, enquanto no outro está em inglês, pois nesse foi solicitado alguns métodos em pt_BR.
