FROM atlassianlabs/docker-node-jdk-chrome-firefox

# Install node + selenium
RUN npm install -g nightwatch webdriver-manager \
    && webdriver-manager update --versions.standalone=2.53.0

COPY . /src

CMD nohup bash -c "webdriver-manager start --versions.standalone=2.53.0 &" \
    && sleep 9 \
    && cd /src \
    && nightwatch index.js