# References:
# https://iridakos.com/tutorials/2019/04/07/dockerizing-a-rails-application.html
# https://blog.codeship.com/running-rails-development-environment-docker/

FROM alpine AS development

RUN apk add --no-cache bash

RUN mkdir /deps

WORKDIR /deps

# Add application
ADD deps/app .

# Add development dependencies
ADD deps/dev .
ADD deps/dev-test-prod .

FROM development AS test

# Remove development dependencies
RUN rm dev

# Add test dependencies
ADD deps/test .

FROM test AS production
# Remove test dependencies
RUN rm test

# Add production dependencies
ADD deps/prod .
