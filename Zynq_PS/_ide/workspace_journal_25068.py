# 2026-10-03T13:17:17.296054900
import vitis

client = vitis.create_client()
client.set_workspace(path="Zynq_PS")

vitis.dispose()

