from paddlespeech.server.bin.paddlespeech_server import ServerExecutor
import threading

streaming_asr_server = ServerExecutor()
streaming_punc_server = ServerExecutor()

asr = threading.Thread(target=streaming_asr_server,
                       kwargs={
                           "config_file": "conf/ws_conformer_wenetspeech_application.yaml",
                           "log_file": "log/paddlespeech_asr.log"
                       })

punc = threading.Thread(target=streaming_punc_server,
                        kwargs={
                            "config_file": "conf/punc_application.yaml",
                            "log_file": "log/paddlespeech_punc.log"
                        })

if __name__ == "__main__":
    print("启动ASR服务")
    asr.start()
    print("启动PUNC服务")
    punc.start()
    asr.join()
    punc.join()
