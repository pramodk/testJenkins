pipeline {
    agent any
        triggers {
            //pollSCM('') //Empty quotes tells it to build on a push  
            githubPush()
        }
        stages {
            stage('Build') {
                steps {
                    echo 'This is the Build Stage'
                }
            }
            stage('Test') {
                steps {
                    echo 'This is the Testing Stage'
                }
            }
            stage('Deploy') {
                steps {
                    echo 'This is the Deploy Stage'
                    sh 'scp test_script.sh bp000359@ela1.cscs.ch:~/bin'
                    sh 'ssh bp000359@ela1.cscs.ch "./bin/execute_daint.sh" '
                }
            }
        }
    }
