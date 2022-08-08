#FROM centos:7
FROM amazonlinux:latest
#FROM amazon/aws-cli:latest
USER root

LABEL "purpose"="local"

#RUN yum -y groupinstall "Development Tools"
RUN yum erase 'ntp*'
RUN yum update -y && \
    yum install -y net-tools git tar wget unzip curl tree man vim iputils && \
    yum install -y gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel libffi-devel chrony && \
    yum clean all

#install packer
RUN cd /tmp && curl -O https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_amd64.zip
RUN cd /tmp && unzip packer_1.7.4_linux_amd64.zip
RUN mv /tmp/packer /usr/local/bin/
RUN rm -rf /tmp/packer_1.7.4_linux_amd64.zip


# install direnv 
RUN wget -O direnv https://github.com/direnv/direnv/releases/download/v2.17.0/direnv.linux-amd64 && \
    chmod +x direnv && \
    mv direnv /usr/local/bin/ 
#    && \
#    echo 'eval "$(direnv hook bash)"' >> /root/.bashrc

# install jq
RUN JQ=/usr/bin/jq && \
    wget -O jq https://stedolan.github.io/jq/download/linux64/jq && \
    chmod +x jq && \
    mv jq /usr/local/bin/

# install `python env`
ENV HOME="/root"
WORKDIR ${HOME}
RUN git clone --depth=1 https://github.com/pyenv/pyenv.git .pyenv
ENV PYENV_ROOT="${HOME}/.pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"

ENV PYTHON_VERSION=3.9.10
RUN pyenv install ${PYTHON_VERSION}
RUN pyenv global ${PYTHON_VERSION}

#install aws_cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install -i /usr/local/aws-cli -b /usr/local/bin && \
    rm -rf awscliv2.zip

RUN pip install --upgrade pip && \
    pip install yawsso virtualenv ansible boto3 keyrings.alt aws_okta_keyman

# install tfenv
RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv
RUN ~/.tfenv/bin/tfenv install 0.11.15 && \
    ~/.tfenv/bin/tfenv install 0.12.31 && \
    ~/.tfenv/bin/tfenv install 1.0.8 && \
    ~/.tfenv/bin/tfenv install 1.0.11

# install terragrunt
#ENV TERRAGRUNT_VERSION=v0.18.0
# ENV TERRAGRUNT_VERSION=v0.33.1
# ADD https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 /bin/terragrunt
# RUN chmod +x /bin/terragrunt
RUN curl -L https://raw.githubusercontent.com/warrensbox/tgswitch/release/install.sh | bash && \
    tgswitch 0.18.7 && tgswitch 0.24.4 && tgswitch 0.33.0 && tgswitch 0.35.10

# RUN mkdir /root/.ssh && chmod 700 /root/.ssh
# COPY ./spoon_infra.pem /root/.ssh/id_rsa
# RUN chmod 600 /root/.ssh/id_rsa

COPY iac-dev-load-profile.sh /etc/profile.d/

ENV TZ="Asia/Seoul"