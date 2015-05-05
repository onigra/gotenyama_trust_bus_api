[![Build Status](https://travis-ci.org/onigra/gotenyama_trust_bus_api.svg?branch=master)](https://travis-ci.org/onigra/gotenyama_trust_bus_api) [![Coverage Status](https://coveralls.io/repos/onigra/gotenyama_trust_bus_api/badge.svg?branch=master)](https://coveralls.io/r/onigra/gotenyama_trust_bus_api?branch=master) [![Code Climate](https://codeclimate.com/github/onigra/gotenyama_trust_bus_api/badges/gpa.svg)](https://codeclimate.com/github/onigra/gotenyama_trust_bus_api) [![Dependency Status](https://gemnasium.com/onigra/gotenyama_trust_bus_api.svg)](https://gemnasium.com/onigra/gotenyama_trust_bus_api)

# Gotenyama Trust Bus Api

御殿山トラストシティのバスの時刻表と、直近のバスの時間を返します。
時刻表は下記をもとに作成しています。

http://www.mori-trust.co.jp/residence/gotenyamatrust/bus/

リクエストを受けた時点の日時で平日か否かの判定を行っています。

# This application is hosting in Heroku

https://floating-taiga-6784.herokuapp.com/busall/shinagawa

# Usage

## 直近のバスの時刻を返す

```
GET /bus/:from_place
```

- 御殿山からのバス

```
# 2015/5/11 19:25

GET /bus/gotenyama

status: 200
response:
{
  next: "19:30"
}
```

- 品川からのバス

```
# 2015/5/4 16:02

GET /bus/shinagawa

status: 200
response:
{
  next: "16:14"
}
```

- バスがもう無い場合

```
# 2015/5/4 3:00

GET /bus/shinagawa

status: 200
response:
{
  next: "Bus is over."
}
```

## 時刻表を返す

```
GET /busall/:from_place
```

- 平日、御殿山発品川駅行き

```
# 2015/5/11

GET /busall/gotenyama

status: 200
response:
{
  "7": [30, 45],
  "8": [0, 8, 15, 20, 25, 30, 35, 40, 45, 50, 55],
  "9": [0, 6, 12, 18, 24, 30, 37, 44, 52],
  "10": [0, 15, 32, 52],
  "11": [12, 32, 52],
  "12": [13, 33, 53],
  "13": [13, 33, 53],
  "14": [13, 33, 53],
  "15": [14, 34, 54],
  "16": [14, 34, 54],
  "17": [14, 34, 54],
  "18": [14, 34, 54],
  "19": [9, 22, 32, 42, 52],
  "20": [2, 12, 24, 39, 54],
  "21": [12, 32, 52]
}
```

- 祝日、品川駅発御殿山行き

```
# 2015/5/4

GET /busall/shinagawa

status: 200
response:
{
  "9": [12,32,52],
  "10": [12,32,52],
  "11": [12,32,52],
  "12": [13,33,53],
  "13": [13,33,53],
  "14": [13,33,53],
  "15": [14,34,54],
  "16": [14,34,54],
  "17": [14,34,54],
  "18": [14,34,54],
  "19": [13,32,52]
}
```
## Contributing

1. Fork it ( http://github.com/onigra/gotenyama_trust_bus_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
