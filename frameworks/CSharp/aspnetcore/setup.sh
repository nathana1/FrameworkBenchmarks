#!/bin/bash

fw_depends dotnetcore

if [ -d test ]; then
  rm -rf test
fi

mkdir test
cd test
git clone -b nathana1/automate-techempower2 https://github.com/aspnet/benchmarks.git

cd benchmarks
dotnet restore --infer-runtimes
cd src/Benchmarks
dotnet build -c Release -f netstandardapp1.5
dotnet run -c Release server.urls=http://*:8080 kestrel.threadCount=8 NonInteractive=true &
