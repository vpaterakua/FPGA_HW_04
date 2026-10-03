# 2026-10-03T11:37:51.693427300
import vitis

client = vitis.create_client()
client.set_workspace(path="MicroBlaze")

platform = client.create_platform_component(name = "microblaze",hw_design = "$COMPONENT_LOCATION/../MicroBlaze_wrapper.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",compiler = "gcc")

platform = client.get_component(name="microblaze")
status = platform.build()

comp = client.create_app_component(name="led_run",platform = "$COMPONENT_LOCATION/../microblaze/export/microblaze/microblaze.xpfm",domain = "standalone_microblaze_0")

status = platform.build()

comp = client.get_component(name="led_run")
comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../MicroBlaze_wrapper.xsa")

status = platform.build()

status = comp.clean()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

vitis.dispose()

