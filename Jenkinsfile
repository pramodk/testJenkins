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
            stage('Deploy') {
                steps {
                    echo 'This is the Deploy BBP Stage'
                    sh 'ssh bp000359@ela1.cscs.ch "mkdir -p ./bbp/" '
                    sh 'ssh bp000359@ela1.cscs.ch "rm -rf ./bbp/*" '
                    sh 'scp * bp000359@ela1.cscs.ch:~/bbp/'
                    sh 'ssh bp000359@ela1.cscs.ch "ls ~/bbp/" '
                    sh 'ssh bp000359@ela1.cscs.ch "./bbp/execute_daint_deploy.sh" '
                }
            }
            stage('Test') {
                steps {
                    echo 'This is the Testing Stage'
                    sh 'ssh bp000359@ela1.cscs.ch "./bbp/execute_daint_run.sh" '
                }
            }
        }
    }
