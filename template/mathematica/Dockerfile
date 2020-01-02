FROM openfaas/classic-watchdog:0.18.0 as watchdog

FROM arnoudbuzing/wolframengine

# Allows you to add additional packages via build-arg
# ARG ADDITIONAL_PACKAGE

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog
# RUN apk --no-cache add ca-certificates ${ADDITIONAL_PACKAGE}

COPY activate.sh           .
RUN chmod +x activate.sh
RUN ./activate.sh
# Add non root user
# RUN addgroup -S app && adduser app -S -G app

WORKDIR /home/app/

COPY index.wls           .
RUN chmod +x index.wls

# RUN chown -R app /home/app && \
#   mkdir -p /home/app/python && chown -R app /home/app
# USER app

# USER root

COPY  function/preprocess_params.wls function/
RUN chmod +x function/preprocess_params.wls

COPY function/code.wls           function/
RUN chmod +x function/code.wls

# RUN chown -R app:app ./ && \
#   chmod -R 777 /home/app/python

# USER app

ENV fprocess="./index.wls"
EXPOSE 8080

HEALTHCHECK --interval=3s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]