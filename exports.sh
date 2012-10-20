export EDITOR=vim

export JAVA_HOME=/usr/lib/jvm/default-java

export AWS_CREDENTIAL_FILE=~/credential-file

export AWS_TOOLS_HOME=/opt/aws_tools

export AWS_CLOUDFORMATION_HOME=$AWS_TOOLS_HOME/cloudformation
export AWS_AUTO_SCALING_HOME=$AWS_TOOLS_HOME/autoscale
export AWS_ELB_HOME=$AWS_TOOLS_HOME/elb

export PATH=$PATH:$AWS_CLOUDFORMATION_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_ELB_HOME/bin:~/scripts

