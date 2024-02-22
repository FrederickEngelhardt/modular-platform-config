# /usr/libexec/java_home -V to see all java versions
# deprecated use jenv
jdk() {
  version=$1;
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  export PATH=$JAVA_HOME/bin:$PATH
}