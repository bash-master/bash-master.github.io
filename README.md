
# Bash Master 배쉬마스터
리눅스 배쉬 쉘에서 자주 사용되는 함수와 스크립트를 정리하고 있습니다.  
우분투에서 테스트를 했으며, 다른 계열 (레드햇 등) 에서는 안될 수도 있습니다.
```
$ <- 쉘 프롬프트를 뜻하며, 쉘에서 바로 실행할 수 있는 명령입니다.
# <- 쉘 프롬프트를 뜻하며, 루트 root 권한으로 실행한다는 의미입니다.
될 수 있으면 명확하게 적어두려고 합니다만, 둘을 혼용해서 사용하기도 합니다.
```

----

### Ch.01 시스템 관련 기본 명령어 [1장 예제 파일](https://github.com/bash-master/bash-master.github.io/tree/master/ch.01)
리눅스 시스템과 관련된 기본적인 명령어, 변수 안내입니다.

1. chmod : 파일 권한 변경.
```
파일은 기본적으로 읽기, 쓰기, 실행하기 - 이렇게 권한이 있는데 각각 숫자로 4, 2, 1 이라는 숫자가 부여되어 있습니다.
읽기+쓰기+실행 = 7
읽기+쓰기 = 6
쓰기+실행 = 3
권한은 u:user, g:group, o:other, a:all 에게 지정할 수 있습니다.
$ chmod ug+rw data.file # data.file 에 user 소유자와 group 그룹에게 read, write 권한을 부여.
$ chmod ug-x data.file # data.file 에 user 소유자와 group 그룹에게 execute 실행 권한을 제거.
$ chmod 644 data.file # 소유자는 읽기+쓰기, 그룹은 읽기, 그외에 사용자도 읽기 권한 부여.
```
1. chown : 파일 소유자 변경.
```
$ chown marasong. data.file # data.file 의 소유자는 marasong 으로, 그룹은 marasong 이 속한 그룹으로 소유권 변경.
$ chown marasong.admin data.file # data.file 의 소유자는 marasong 으로, 그룹은 admin 그룹으로 소유권 변경.
```
1. date : 날짜 관련 명령어. [상세보기](https://github.com/bash-master/bash-master.github.io/blob/master/ch.01/ch.01.data.sh)
```
$ date +%Y"-"%m"-"%d" "%H":"%M":"%S # 오늘날짜 
2019-11-22 13:29:42
$ date --date="1 days" +%Y"-"%m"-"%d" "%H":"%M":"%S # 1일뒤 (내일) 날짜
2019-11-23 13:29:42
$ date --date="-1 days" +%Y"-"%m"-"%d" "%H":"%M":"%S # 1일전 (어제) 날짜
2019-11-21 13:29:42
```
1. df : 파티션별 점유하고 있는 디스크 공간 확인.
```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            488M     0  488M   0% /dev
tmpfs           100M   11M   89M  11% /run
/dev/xvda1      7.7G  5.9G  1.9G  76% /
/dev/xvdf        99G   76G   18G  82% /data
```
1. dmesg : 부팅되면서 체크하는 내용 확인하기. 부팅이후 중요 메시지도 이 명령어로 확인할 수 있다.
1. du : 디렉토리별 점유하고 있는 디스크 공간 확인.
```
$ du -sh # 현재 디렉토리 사용공간 확인.
216K    .
```
1. find : 파일 찾기.
1. free : 메모리 사용량 확인.
```
$ free -m # 옵션 m = MB 메가단위
              total        used        free      shared  buff/cache   available
Mem:            990         320          92          15         577         472
Swap:          2047         204        1843
```
1. hostname : 호스트명 확인.
```
$ hostname # 호스트이름 확인.
# hostnamectl set-hostname MyHostName # 호스트이름 변경. 루트로 작업.
```
1. id : 로그인 한 아이디 확인.
1. ifconfig : 네트워크 설정 보기.
```
$ ifconfig 
$ ifconfig -a 
```
1. lastlog : 마지막 로그인 시각 확인하기.
1. lsof : 열려 있는 파일 리스트 보기.
```
$ lsof -p [PID] # PID 에 해당하는 프로세스가 현재 오픈하고 있는 파일 리스트.
```
1. ls : 파일 리스트 보기.
```
$ ls -al # 파일 자세히 보기, 숨김파일까지 보기.
$ ls -alt # 수정된 시간 time 순서 정렬. 최근 파일 먼저 출력.
$ ls -altr # 수정된 시간 time 순서 정렬. 최근 파일 나중에 출력.
$ ls -alS # 파일 크기 Size 순서 정렬. 용량 큰 파일 먼저 출력.
$ ls -alSr # 파일 크기 Size 순서 정렬. 용량 큰 파일 나중에 출력.
```
1. mount / umount : 디스크 마운트 / 언마운트.
1. ps : 프로세스 상태 보기.
```
$ ps -axlf
F   UID   PID  PPID PRI  NI    VSZ   RSS WCHAN  STAT TTY        TIME COMMAND
1     0     2     0  20   0      0     0 kthrea S    ?          0:05 [kthreadd]
1     0     3     2   0 -20      0     0 rescue I<   ?          0:00  \_ [rcu_gp]
4     0   818     1  20   0   5688   444 poll_s Ss   ?          0:00 /usr/bin/vncserver-x11-serviced -fg
4     0   834   818  20   0  39716  5024 poll_s Sl   ?         18:48  \_ /usr/bin/vncserver-x11-core -service
4     0   819     1  20   0 130452  1736 epoll_ Ss   ?          6:04 php-fpm: master process (/etc/php/7.0/fpm/php-fpm.conf)
5    33   860   819  20   0 141256 12648 skb_wa S    ?          2:07  \_ php-fpm: pool www
5    33  2790   819  20   0 141236 10596 skb_wa S    ?          1:49  \_ php-fpm: pool www
5    33 26647   819  20   0 130968 10428 skb_wa S    ?          0:50  \_ php-fpm: pool www
4     0   828     1  20   0  37404  1924 poll_s Ssl  ?          0:00 /usr/sbin/lightdm
4     0   861   828  20   0 145828  4420 epoll_ Ssl+ tty7      54:18  \_ /usr/lib/xorg/Xorg :0 -seat seat0 -auth
4     0  1036   828  20   0  29604  1076 wait   Sl   ?          0:00  \_ lightdm --session-child 14 17
$ ps -elf
```
1. route : 라우트 경로 보기.
```
$ route -n
```
1. stty : 터미널 설정하기.
1. sudo : 실행권한 바꿔서 실행하기.
1. top : 프로세스 상태 보기. 빠져 나올땐 Ctrl+C
1. tty : 접속 터미널 확인하기.
1. uname : 리눅스 시스템 이름 확인하기.
```
$ uname
Linux
$ uname -a
Linux raspberrypi #1245 SMP Fri Jul 12 17:25:51 BST 2019 armv7l GNU/Linux
```
1. uptime : 시스템이 부팅된 날짜 확인하기.
1. useradd / userdel : 사용자 추가 / 사용자 삭제
1. w : 로그인한 유저 확인하기.
```
$ w
 11:16:55 up 51 days, 19:52,  2 users,  load average: 0.21, 0.23, 0.26
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
pi       tty7     :0               08Oct19 52days 54:18  18.84s /usr/bin/lxsession -s LXDE-pi -e LXDE
pi       pts/0    192.168.11.12    11:16    0.00s  0.67s  0.23s sshd: pi [priv] 
```
1. who : 로그인한 유저 확인하기 2.
```
$ who
pi       tty7         2019-10-08 15:26 (:0)
pi       pts/0        2019-11-29 11:16 (192.168.11.12)
```

----

### Ch.02 문자열, 텍스트 파일 관련 함수 [2장 예제 파일](https://github.com/bash-master/bash-master.github.io/tree/master/ch.02)

1. &gt; / &gt;&gt; : 입/출력 리다이렉션. 꺽쇠 한개 또는 두개.
```
$ echo "123" > test.txt # 출력 결과를 test.txt 파일로 보내기.
$ mysql -uroot -p testdb < test.sql # test.sql 파일 내용을 mysql 실행파일의 입력값으로 보내기.
```
1. awk : 문자열 자르기.
```
$ echo "123.456" | awk -F"." '{print $1"--"$2}'
123--456
$ echo "123/456/789" | awk -F"/" '{print $2"---"$3}'
456---789
```
1. cat : 파일 내용 출력.
1. cut : 문자열 자르기.
```
$ echo "123.456" | cut -d"." -f1 
123
$ echo "123.456" | cut -d"." -f2 
456
$ echo "123.456" | cut -c 3-5
3.4
```
1. grep : 원하는 문자열 찾기. 문자열 검색.
```
$ grep -i abc *.txt # 대소문자 구분없이 abc 문자열을 *.txt 파일에서 찾기.
$ grep -iw abc *.txt # 대소문자 구분없이 abc 단어를 *.txt 파일에서 찾기.
$ grep -iwR abc *.txt # 대소문자 구분없이 abc 단어를 하위 디렉토리 포함해서 *.txt 파일에서 찾기.
```
1. head : 파일의 맨 위에 있는 문자열 출력하기.
1. sed : 원하는 문자열을 찾아서 대체하기. 문자열 바꾸기.
1. tail : 파일의 맨 아래에 있는 문자열 출력하기.


### Ch.03 반복 및 분기 함수 [3장 예제 파일](https://github.com/bash-master/bash-master.github.io/tree/master/ch.03)
반복해서 작업해야 할때, 작업 대상마다 다르게 처리해야 할때 유용합니다.

1. 조건 : if then...else...
```
if [ -z ${WORK_FILE} ]
then
        echo "Work File is NULL. exit."
        exit
fi
```
1. 반복 : for
```
for i in `seq 1 1 10`
do
	echo "${i}"
done
```
1. 반복 : while
```
END_COUNT=10
WORK_COUNT=0
while [ ${WORK_COUNT} -le ${END_COUNT} ]
do
    echo ${WORK_COUNT}
	let WORK_COUNT=WORK_COUNT+1
done
```
1. 분기 : case
```
phone_num=$1
case ${phone_num} in
	01021118988)
		echo "와, 저하고 핸드폰번호가 같네요~"
		;;
	011???????|011????????)
		echo "011 번호를 아직도 쓰시네요~"
		;;
	012???????|012????????)
		echo "012 는 삐삐번호였다가 사물지능통신 M2M 으로 부여된 번호입니다.
		echo "차량이나 카드 결제기에 부여될 수 있습니다. 핸드폰번호가 아니에요."
		;;
	013???????|013????????)
		echo "013 은 수신전용입니다."
		;;
	*)
		echo "핸드폰 번호를 넣어주세요"
		exit 1
esac
```

----

### Ch.04 시스템 상태 확인 CLI 프로그램 [4장 예제 파일](https://github.com/bash-master/bash-master.github.io/tree/master/ch.04)

1. chkconfig : 
1. iostat : 디스크 관련 사용량 보기.
```
$ iostat 1 3
avg-cpu:  %user   %nice %system %iowait  %steal   %idle
          30.11    0.00    6.45    0.00    1.08   62.37
Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
loop0             0.00         0.00         0.00          0          0
xvda              1.08         0.00         4.30          0          4
xvdf              0.00         0.00         0.00          0          0
```
1. mpstat : 프로세스 관련 사용량 보기.
```
$ mpstat 1 3
05:45:01 AM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
05:45:02 AM  all   31.31    0.00   14.14    0.00    0.00    0.00    0.00    0.00    0.00   54.55
05:45:03 AM  all   67.71    0.00   20.83    0.00    0.00    1.04    0.00    0.00    0.00   10.42
05:45:04 AM  all   32.98    0.00   10.64    1.06    0.00    0.00    0.00    0.00    0.00   55.32
Average:     all   43.94    0.00   15.22    0.35    0.00    0.35    0.00    0.00    0.00   40.14
```
1. netstat : 네트워크 정보 보기.
```
$ netstat -anlp | grep LISTEN
```
1. vmstat : 가상 메모리 관련 사용량 보기.
```
$ vmstat 1 3
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0 291072 104380  63312 472128    1    1    24   142    0    1  2  1 97  0  0
 0  0 291072 104396  63312 472152    0    0     0   204   94  127  0  0 99  0  1
 0  0 291072 104008  63312 472156    0    0     0    32  113  147  1  0 99  0  0
 ```
1. strace : 
1. sysv-rc-conf : 
1. tcpdump : 패킷 캡처 프로그램.
```
$ tcpdump port 22 -nnn
```

----

### Ch.05 많이 쓰는 쉘 커멘드라인 CLI 프로그램 [5장 예제 파일](https://github.com/bash-master/bash-master.github.io/tree/master/ch.05)
유용해서 자주 사용하는 쉘 커멘드라인 프로그램 안내입니다.

1. 웹 호출 : curl
1. MSSQL 접속 : tsql
1. MySQL 접속 : mysql

----

QnA : 묻고 답하기 : [다음카페 배쉬마스터](http://cafe.daum.net/bashmaster/qm9n)  
여기에 사용된 모든 예제 파일에 대한 권리는 본 사이트 관리자에게 있습니다.  
예제 파일 : 개인 용도 사용 가능, 상업적 사용 불가능.
참고 사이트 : https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/comparison-ops.html

