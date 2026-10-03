# 2026-10-03T13:19:02.290599600
import vitis

client = vitis.create_client()
client.set_workspace(path="Zynq_PS")

comp = client.create_app_component(name="led_run",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="led_run")
comp.build()

client.delete_component(name="hello_world")

client.delete_component(name="componentName")

