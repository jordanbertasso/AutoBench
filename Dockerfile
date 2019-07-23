FROM debian:latest

RUN apt-get update && apt-get install -y curl git vim make build-essential

RUN apt-get install -y libgirepository1.0-dev libwebkit2gtk-4.0-dev libgtksourceview-3.0-dev libgsl0-dev liblapack-dev libatlas-base-dev

RUN apt-get install -y haskell-platform

RUN curl -sSL https://get.haskellstack.org/ | sh

ENV PATH=/root/.local/bin/:$PATH

RUN git clone https://github.com/jordanbertasso/AutoBench.git

# RUN stack upgrade --git

WORKDIR /AutoBench

# RUN ls

# RUN stack setup
# RUN stack build

# RUN stack --install-ghc build
RUN stack -j1 build

RUN curl https://bitbucket.org/altmattr/pattern-compilation-benchmarks/raw/9a233daa5fbb275499ad7d470f46089f4fe838c7/Wadler87.hs > ./Wadler87.hs

ENV LANG=C.UTF-8

# CMD [ "stack", "exec", "--", "AutoBench", "Wadler87.hs" ]


# docker pull jordanbertasso/haskell-autobench
# docker run -it jordanbertasso/haskell-autobench
# stack exec -- AutoBench Wadler87.hs