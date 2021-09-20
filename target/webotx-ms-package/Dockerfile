# WebOTX Application Server Docker container image

# Base image
FROM registry.access.redhat.com/ubi8/ubi

# install basic packages
RUN yum -y --disableplugin=subscription-manager install \
findutils \
grep \
hostname \
iproute \
libselinux-utils \
procps-ng \
tar && \
yum --disableplugin=subscription-manager clean all && \
rm -rf /var/cache/yum/*

# install jdk
RUN yum -y --disableplugin=subscription-manager install java-1.8.0-openjdk-devel && \
yum --disableplugin=subscription-manager clean all && \
rm -rf /var/cache/yum/*

# Add WebOTX Operation User as non-root
RUN useradd -u 10001 -g 0 -d / -M -s /sbin/nologin asadm

# Copy and Unpack Uber JAR
COPY debitbill-1.0-SNAPSHOT-micro.jar /
ENV OTX_UBER_JAR debitbill-1.0-SNAPSHOT-micro.jar
RUN java -jar debitbill-1.0-SNAPSHOT-micro.jar --unpack-only --basedir /opt && chown -R asadm /opt/WebOTX && chmod -R g=u /opt/WebOTX

# Change user
USER asadm

# Run Uber JAR
ENTRYPOINT ["java", "-jar", "debitbill-1.0-SNAPSHOT-micro.jar", "--basedir", "/opt"]
