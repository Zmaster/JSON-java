# Copyright © 2011 Jason J.A. Stephenson
#
# This file is part of JSON-java. It is distributed under the same
# license as JSON-java. Don't use it to be evil.

DOC_DIR ?= target/apidocs/

SOURCES = CDL.java \
          JSONObject.java \
          Cookie.java \
          JSONStringer.java \
          CookieList.java \
          JSONString.java \
          HTTP.java \
          JSONTokener.java \
          HTTPTokener.java \
          JSONWriter.java \
          JSONArray.java \
          JSONException.java \
          XML.java \
          JSONML.java \
          XMLTokener.java

ifdef WITH_JUNIT
SOURCES += \
      Test.java
endif

.PHONY: documentation compile jar clean init

jar: init compile
	jar cf ./target/JSON.jar ./target/classes

compile: $(SOURCES)
	javac -d ./target/classes -sourcepath ./target/filtered-sources/org/json/ $^

documentation: $(SOURCES)
	javadoc -d $(DOC_DIR) -doctitle JSON-java -windowtitle JSON-java $^

clean:
	-rm -rf target/

init:
	-mkdir target/
	-mkdir target/apidocs/
	-mkdir target/classes/
	-mkdir -p target/filtered-sources/org/json/
	cp $(SOURCES) target/filtered-sources/org/json/
	