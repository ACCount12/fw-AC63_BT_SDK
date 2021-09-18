@echo off

@echo ********************************************************************************
@echo 			SDK BR23			
@echo ********************************************************************************
@echo %date%

cd /d %~dp0



isd_download.exe -tonorflash -dev br25 -boot 0x12000 -div8 -wait 300 -uboot uboot.boot -app app.bin cfg_tool.bin -res tone.cfg  -uboot_compress -format all



::-uboot_compress
:: -format all
::-reboot 2500
:: -key 002�״�AC690X-4A30.key

::-format all
::-reboot 100



@rem ���ɹ̼������ļ�
fw_add.exe -noenc -fw jl_isd.fw  -add ota.bin -type 100 -out jl_isd.fw
@rem ������ýű��İ汾��Ϣ�� FW �ļ���
fw_add.exe -noenc -fw jl_isd.fw -add script.ver -out jl_isd.fw


ufw_maker.exe -fw_to_ufw jl_isd.fw
copy jl_isd.ufw update.ufw
del jl_isd.ufw

@REM ���������ļ������ļ�
::ufw_maker.exe -chip AC800X %ADD_KEY% -output config.ufw -res bt_cfg.cfg

::IF EXIST jl_693x.bin del jl_693x.bin 


@rem ��������˵��
@rem -format vm        //����VM ����
@rem -format cfg       //����BT CFG ����
@rem -format 0x3f0-2   //��ʾ�ӵ� 0x3f0 �� sector ��ʼ�������� 2 �� sector(��һ������Ϊ16���ƻ�10���ƶ��ɣ��ڶ�������������10����)

ping /n 2 127.1>null
IF EXIST null del null

pause
