
SPRD_MODULES_CCOMPILE := $(PWD)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-4.8/bin/arm-eabi-

SPRD_MODULES:
	make -C vendor/sprd/modules/libgpu/gpu/utgard/ MALI_PLATFORM=sc8830 BUILD=debug KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(SPRD_MODULES_CCOMPILE) clean
	make -C vendor/sprd/modules/libgpu/gpu/utgard/ MALI_PLATFORM=sc8830 BUILD=debug KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(SPRD_MODULES_CCOMPILE)
	mv vendor/sprd/modules/libgpu/gpu/utgard/mali.ko $(KERNEL_MODULES_OUT)
	make -C vendor/sprd/wcn/wifi/sc2331/6.0/ SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=debug KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(SPRD_MODULES_CCOMPILE) clean
	make -C vendor/sprd/wcn/wifi/sc2331/6.0/ SPRDWL_PLATFORM=sc8830 USING_PP_CORE=2 BUILD=debug KDIR=$(KERNEL_OUT) CROSS_COMPILE=$(SPRD_MODULES_CCOMPILE)
	mv vendor/sprd/wcn/wifi/sc2331/6.0/sprdwl.ko $(KERNEL_MODULES_OUT)
	mkdir -p $(PRODUCT_OUT)/system/lib/modules
	ln -sf /lib/modules/autotst.ko $(PRODUCT_OUT)/system/lib/modules/autotst.ko
	ln -sf /lib/modules/mali.ko $(PRODUCT_OUT)/system/lib/modules/mali.ko
	ln -sf /lib/modules/mmc_test.ko $(PRODUCT_OUT)/system/lib/modules/mmc_test.ko
	ln -sf /lib/modules/sprdwl.ko $(PRODUCT_OUT)/system/lib/modules/sprdwl.ko
