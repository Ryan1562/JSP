-- 회원
drop table member cascade constraints;
CREATE TABLE member
(
	mno    NUMBER CONSTRAINT member_mno_PK PRIMARY KEY NOT NULL,
    id    VARCHAR2(30) NOT NULL,
    password    VARCHAR2(20) NOT NULL,
    name    VARCHAR2(20) NOT NULL,
    nick_nm    VARCHAR2(20) NOT NULL,
    phone    VARCHAR2(20) NOT NULL,
    gender    CHAR(2) default 'm' NOT NULL,
    age    NUMBER(3) NOT NULL,
    loc    VARCHAR2(12) NOT NULL,
    del    CHAR(1) default 'n' NOT NULL,
    reg_date    DATE NOT NULL,
    profile VARCHAR2(100) NULL
);
select * from member where id='k1@k.com';
select * from member;
insert into member values (0, 'admin', '1234', '관리자', '관리자', '010-111-1111', 'f', 0,'0','n', sysdate,'profile.png');
update member set profile='profile_test.jpg' where mno=7;
insert into member values (1, 'do', '1111', '도도', '도도', '010-111-1111', 'f', 0,'0','n', sysdate, 'profile.png');
insert into member values (2, 'wo', '2222', '림림', '림림', '010-111-1111', 'f', 0,'0','n', sysdate, 'profile.png');
insert into member values (3, 'na', '3333', '나나', '나나', '010-111-1111', 'f', 0,'0','n', sysdate, 'profile.png');

-- 전시
drop table display;
CREATE TABLE display
(
    dno    NUMBER CONSTRAINT display_dno_PK PRIMARY KEY NOT NULL,
    dname    VARCHAR2(50) NOT NULL,
    start_date    DATE NOT NULL,
    end_date    DATE NOT NULL,
    spot    VARCHAR2(50) NOT NULL,
    loc     VARCHAR2(12) NOT NULL,
    address     VARCHAR2(50) NOT NULL,
    poster    VARCHAR2(100) NOT NULL,
    tag    VARCHAR2(50),
    intro    VARCHAR2(500) NOT NULL,
    detail_img  VARCHAR2(100),
    detail_txt VARCHAR2(1000),
    hours    VARCHAR2(50) NOT NULL,
    fee    NUMBER(6),
    fee_adult   NUMBER(6) default 0,
    fee_teen    NUMBER(6) default 0,
    fee_child   NUMBER(6) default 0,
    discount    NUMBER(3) default 0,
    artist    VARCHAR2(20),
    tel    VARCHAR2(20),
    home_pg    VARCHAR2(100),
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint display_mno_fk references member NOT NULL
);
select * from display;
alter table display modify(artist VARCHAR2(100));
alter table display modify(dname VARCHAR2(100));
alter table display modify(address VARCHAR2(200));
alter table display drop column tag;
alter table display add(tag VARCHAR2(50));

-- 북마크
drop table bookmark;
CREATE TABLE bookmark
(
    bm_no    NUMBER CONSTRAINT bookmark_bm_no_PK PRIMARY KEY NOT NULL,
    mno    NUMBER constraint bookmark_mno_fk references member NOT NULL,
    dno    NUMBER constraint bookmark_dno_fk references display NOT NULL
);
select * from bookmark;

-- 예매
drop table reservation;
CREATE TABLE reservation
(
    rs_no    NUMBER CONSTRAINT reservation_rs_no_PK PRIMARY KEY NOT NULL,
    cnt    NUMBER(4) default 0,
    cnt_adult    NUMBER(3) default 0,
    cnt_teen    NUMBER(3) default 0,
    cnt_child    NUMBER(3) default 0,
    mno    NUMBER constraint reservation_mno_fk references member NOT NULL,
    dno    NUMBER constraint reservation_dno_fk references display NOT NULL
);
select * from reservation;

-- 한줄 리뷰
drop table review;
CREATE TABLE review
(
    rv_no    NUMBER CONSTRAINT review_rv_no_PK PRIMARY KEY NOT NULL,
    star_rate    NUMBER(2) NOT NULL,
    content    VARCHAR2(500) NOT NULL,
    reg_date    DATE NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint review_mno_fk references member NOT NULL,
    dno    NUMBER constraint review_dno_fk references display NOT NULL
);
select * from review;
select * from review where dno = 1 order by rv_no desc;

-- 리뷰 좋아요
drop table rvLikes;
CREATE TABLE rvLikes
(
    mno    NUMBER constraint rvlikes_mno_fk references member NOT NULL,
    rv_no    NUMBER constraint rvlikes_rv_no_fk references review NOT NULL
);
select * from rvLikes;
delete from rvLikes where mno = 0;

-- 게시판(스토리)
drop table board cascade constraints;
CREATE TABLE board
(
    bno    NUMBER CONSTRAINT board_bno_PK PRIMARY KEY NOT NULL,   
    title    VARCHAR2(100) NOT NULL,
    content    VARCHAR2(4000) NOT NULL,
    reg_date    DATE NOT NULL,
    read_cnt    NUMBER default 0 NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint board_mno_fk references member NOT NULL,
     thumbnail VARCHAR2(100)
);
Insert into scott.BOARD values (1,'푸드테크 혁신','<p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">최근 F&amp;B업계 종사자와 대화를 나누던 중 “요즘 F&amp;B 산업은 IT 기업에서 더 활발하다”라는 이야기를 한 적이 있다. 그만큼 정보통신 기술의 발전과 식품 소비 행태는 서로 밀접하게 영향을 주고받으며 혁신적으로 변화하고 있다. 1~2인 가구의 증가, 도시화, 노령화 등 국내에서 빠르게 나타나는 변화는 효율적인 소비를 부추기고 있고, 이에 따라 F&amp;B 산업에서도 IT 기술이 적극적으로 활용되는 양상을 보인다.&nbsp;</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><b>이커머스와 푸드테크의 등장</b></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">이커머스(e-commerce)를 통한 식품 구매가 활발하게 일어나기 시작한 것은 비교적 최근 일이다. 화장품, 생활용품 중심으로 이뤄지던 구매가 2018년에는 일반 식품, 그다음 해에는 신선식품 분야로 빠르게 퍼져나갔고, 이커머스 채널 내 F&amp;B 카테고리는 매해 30% 이상의 성장세를 보인다. 특히 보존 기간이 짧아 이커머스 내에서 판매가 까다로웠던 신선식품은, 품목이 단순 확장됐다기보다 소비 의존도가 높아졌다는 측면에서 진일보한 발전이다. 생활용품보다 구매 주기가 훨씬 짧은 신선식품이 주요 소비 품목으로 자리 잡으면 이커머스는 오프라인 시장을 넘어서는 기본적인 소비 채널로 자리 잡을 가능성이 크다.&nbsp;</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">한편 미디어에서는 푸드테크(food-tech)라는 용어가 자주 노출되 기 시작했다. 식품(food)과 기술(technology)의 합성어인 푸드테크는 정보통신 기술을 기반으로 생산, 가공, 유통, 서비스의 영역에서 혁신을 꾀하는 산업을 통칭한다. 이로 인한 변화는 다소 거시적이며 장기적인 시선으로 바라봐야 하기에 당장 체감하기는 어렵다. 그러나 배달의민족과 쿠팡을 필두로 배달과 유통을 결합한 서비스가 등장해 편의를 제공하고 있으며, 소비자는 다양한 온라인 플랫폼을 통해 콩고기와 같은 대체식품에 손쉽게 접근하는 등 직접적인 효익을 얻게 됐다.</p>',to_date('2021/06/09','YYYY/MM/DD'),1,0,'n',0,'tech.jpg');
Insert into SCOTT.BOARD values (2,'우리는 로컬숍을 연구한다','<p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;">어린 시절 지방에 살던 나는 9시 뉴스가 방송되는 도중에 앵커와 스튜디오 배경이 바뀌는 것을 당연하게 여겼다. KBS 뉴스, MBC 뉴스로 시작한 프로그램이 9시 30분쯤 전주 KBS, 전주 MBC 스튜디오로 넘어간 것이다. 전주 지역국 방송에서는 우리 지역의 정치, 사회, 경제 문제 등을 조명했다. 그것이 지역 방송이라는 사실은 한참이 지나서야 알았다.</p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;">&nbsp;</p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;">로컬 미디어는 특정 지역에 기반을 두고 해당 지역 사회의 소식을 다뤄 그에 대한 이해를 돕는 매체를 지칭한다. 엄밀히 말해 《브로드컬리》는 로컬 미디어가 아니다. 다만 매호 특정 지역을 설정해 취재 영역을 한정하고, 그곳의 로컬숍을 가감없이 담아 소개하는 매체다. 그렇다면 로컬숍이란 무엇인가? 직역하자면 동네 가게, 1차원적으로는 프랜차이즈 가맹점이 아닌 가게를 의미한다. 나아가 부동산 재산으로서 공간을 소유하고 있지 않지만, 가게를 연 주인이 직접 운영하는, 개인이 기획하고 일궈나가는 가게라고 할 수 있다. 우리가 이러한 의미의 로컬숍에 주목하는 이유는 이들이 지역의 고유한 색을 만드는 시작이라고 생각하기 때문이다. 지역을 개성 있게 만들어주는 매력적인 공간을 조명하되, 단순히 예쁘고 작은 가게의 낭만을 벗어나 상업 공간이자 삶의 터전인 가게의 솔직한 민낯을 보여주고자 한다.&nbsp;</p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><br style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"></p>',to_date('2021/06/09','YYYY/MM/DD'),1,0,'n',0,'local.jpg');
Insert into SCOTT.BOARD values (3,'위대한 유산','<p><span style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 16px; text-align: justify;">매끈한 외관을 자랑하는 빌딩 사이로 조금은 을씨년스러운 낡은 건물이 묘한 분위기를 풍긴다. 서로 다른 시대의 건물들이 붙어 있는 모습은 을지로에선 흔히 볼 수 있는 풍경이다. 일제강점기, ‘황금정’이라 불리던 을지로는 대형 은행과 기업이 들어와 거대 상업지구를 이룬 번화가였다. 시대를 풍미했던 중심 거리로서 이곳에는 지금도 근현대사를 대표하는 건물들이 오롯이 남아 있다. 을지로와 남대문로가 교차했던 핫플레이스, 을지로1가를 중심으로 무심코 지나쳤을 위대한 유산들을 다시 들여다본다.</span></p><p><span style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 16px; text-align: justify;"><br></span></p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><b><span style="font-size: 18px;">광통관</span></b></p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;">우리나라 최초의 근대식 은행 건물</p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><br></p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;">지금 우리가 서 있는 곳은 광통관 앞입니다. 근처에 청계천 다리 중 하나인 광통교가 있어 붙인 이름이에요. 1909년에 지은 우리나라 최초의 근대식 은행 건물입니다. 붉은 벽돌로 꾸민 외관과 기둥 형태가 서구식 건축을 표방하고 있죠. 현재는 우리은행 종로지점으로 쓰이고 있는데, 이렇게 최초 용도가 유지되는 근대 건축물은 매우 드뭅니다. 광통관은 현대 건축물에서 찾기 힘든 섬세한 아름다움을 지녔다는 평가를 받는데요, 한번 구석구석 자세히 들여다볼게요. 먼저 서양식 기둥이 눈에 띄죠? 보통 기둥은 한 층에 하나씩 들어서는데, 여기서는 두 층을 관통하고 있어요. 바로크 시대에는 모범적인 규칙을 깨뜨리는 큰 기둥 양식이 나타나요. 광통관에 세운 기둥은 크기가 작아 귀여운, 네오바로크 양식에 가깝다고 볼 수 있죠. 이 외에도 메달 모양을 닮은 타원형의 메달리온 장식, 아치형의 창, 지붕 위 돔도 바로크풍의 아름다움을 더합니다. 붉은 색감과 서구식 건축 양식이 돋보이는 광통관은 건축적 의미 말고도 ‘민족 자본은행’ 본점으로 사용된 역사적 의의까지 지녔습니다. 일제강점기, 일본은 자국의 은행을 내세워 경제 침략을 본격화했고, 광통관은 우리나라의 지배층과 실업가들이 힘을 모아 만든 ‘대한천일은행’의 본점으로 사용되었어요. 원래 탁지부(조선 말기에 국가 재정 전반을 담당한 중앙 관청)는 금융 관련 집회소로 쓰기 위해 광통관을 만들었는데, 1층은 대한천일은행에 사옥을 대여해주고 2층에는 집회실, 흡연실을 마련해 본래 기능을 하게 했어요. 경제 중심지였던 남대문로 거리에 우리나라 은행 점포로서 자랑스럽게 첫발을 내딛은 장소입니다.</p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><br style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"></p><p><br></p>',to_date('2021/06/09','YYYY/MM/DD'),4,1,'n',0,'bank.jpg');
Insert into SCOTT.BOARD values (4,'리얼제주 매거진 iiin','<p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;">누군가의 여행지는 다른 누군가가 일상을 가꾸는 터전이기도 하다. 관광객 혹은 주민. 자신이 어떤 위치에 서 있느냐에 따라 같은 지역에 발을 딛고 있어도 다른 모습을 보기 마련이다. 파란 바다, 푸르른 숲 그리고 예쁜 카페와 맛집 등 모두가 관광지로서의 제주도를 조명하던 2014년, 콘텐츠 그룹 재주상회의 고선영 대표는 &lt;리얼제주 매거진 iiin&gt;을 통해 이 지역의 삶을 담기 시작했다. “아무도 하지 않아 자신이 만들 수밖에 없었다”던 잡지 속에 담긴 섬의 일상은 이제 지면을 넘어 상품과 공간으로 구현되고 있다.&nbsp;</p><hr style="border-right: none; border-bottom: none; border-left: none; border-image: initial; border-top-style: solid; border-top-color: initial; margin-top: 40px; margin-bottom: 40px; background: rgb(238, 238, 238); color: rgba(204, 204, 204, 0.5);"><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><b>2010년 제주도에 내려가, 2014년 봄에 첫 호를 발행했다. 모두가 종이 매체의 종말을 이야기하며 말렸고 본인 또한 제작 이전까지 고민했다고. 그런데도 첫 호는 성공했다.&nbsp;</b><br></p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;">제주에 정착하기 이전부터 오랜 기간 여행 기자로 일한 경험 덕분에 이곳에 콘텐츠가 많다는 것은 알고 있었다. 그러나 수많은 매체가 폐간되는 것을 봤기에 선뜻 나서기가 어려웠다. 이 지역의 콘텐츠를 누군가 알리면 좋을 것 같은데, 아무도 하지 않아 오랜 고민 끝에 시작했다. 당시 1만 부를 인쇄해 5,000부는 전국 배포 잡지 유통사에 맡기고 5,000부는 도내에서 소비하고자 했다. 그때는 지방 서점이 별로 없던 시기였는데, 2013년 통계를 보면 제주도에 서점은 26곳뿐이었다. 이 중에서도 대부분이 중고등학교 근처에서 학습지를 주로 팔았다. 그런 상황에서 서점이 아니더라도 사람들이 모이는 곳에서 책을 판매할 수 있는 새로운 유통 방식을 고민했고, 게스트하우스와 카페를 생각해냈다. 지금은 카페에서 굿즈나 서적 등을 판매하는 것이 흔하지만 당시만 해도 그런 경우가 없었다. 결국 아는 친구의 카페와 게스트하우스를 포함해 총 여섯 곳에서 판매를 시작했다. 가장 먼저 조천에 있는 작은 게스트하우스에 스무 권을 두고 제주시에 있는 카페에 책을 가져다주러 가고 있는데 전화가 왔다. 그 짧은 시간에 스무 권이 다 팔렸다고. SNS에 제주를 소재로 한 잡지가 생겼다고 알렸더니 사람들이 달려와서 샀다고 하더라. 아무도 말은 하지 않았지만, 다들 이런 잡지가 나오길 기다렸던 것 같다. 시기가 좋았다.&nbsp;</p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><br style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"></p>',to_date('2021/06/09','YYYY/MM/DD'),0,0,'n',0,'book.jpg');
Insert into SCOTT.BOARD values (5,'서울시 농부의 시장','<p><span style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 16px; text-align: justify;">삭막한 콘크리트로 둘러싸인 도시에서 살다 보면 계절의 흐름을 놓치기 쉽다. 그런데 상암동 디지털미디어시티에선 때로 빌딩숲 한가운데 계절이 펼쳐진다. 바로 ''서울시 농부의 시장''이 열리는 날이다. 매 계절 조금씩 다르지만 격주 금요일과 토요일마다, 전국 각지에서 올라온 농부들이 분주히 땀 흘려 모은 계절의 결실을 사람들 앞에 펼쳐 놓는다.</span></p><p><span style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 16px; text-align: justify;"><br></span></p><p><span style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 16px; text-align: justify;">코로나19로 벚꽃과 푸른 녹음에서 억지로 눈을 돌려야 했던 우리처럼, 농부의 시장도 봄과 여름에는 계절을 잊은 듯 잠깐 멈춰 있었다. 그러다 이윽고 찾아온 가을과 함께 다시 열렸다. 그 소식을 듣고 에코백을 하나 챙겨 계절을 만나러 향했다. 얼굴에 닿는 선선한 아침 공기와 단풍으로 물든 가로수 사이에, 시장이 일렬로 늘어서 있었다.&nbsp;</span><span style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 16px; text-align: justify;"><br></span></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><img src="https://lh3.googleusercontent.com/mrTRQg_58M0-BxdAN3KRc5mZcUOKXyXQARaFEF1-j7AFSgqzElN-ZzMARuVEQXBbR0CyXyfFDzRRTv8wZFHsIa1qd04n=w2048" style="width: 700px;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><b><br></b></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><b>코끝에 가을</b></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">11월 농부의 시장은 가을 제철 작물을 모두 모았다는 설명 그대로였다. 체온을 재고 장터에 입장하니 곧바로 달콤한 군고구마 냄새가 코에 닿는다. 허기지게 만드는 냄새를 따라 걸으니 산더미처럼 쌓인 알밤과 빨갛게 익은 사과, 커다란 단감과 홍시들이 보여 눈까지 즐거웠다. 거기에 이름과 똑 닮은 생김새의 노루궁둥이버섯, 향긋한 송이버섯과 표고버섯, 큼직한 늙은 호박과 주먹만 한 밤호박까지. 이제서야 진정 가을이 왔음을 느낀다. 동네 마트뿐 아니라 온라인으로도 손쉽게 장을 볼 수 있지만 이렇게 계절이 만들어낸 빛깔을 눈에 담고 계절의 향을 맡는 건 오로지 시장에서만 가능한 일이다. 알알이 윤이 흐르는 밤톨과 토실토실한 노루궁둥이버섯은 웃음이 날 만큼 귀여워 눈에도 담고, 사진으로도 남겼다.</p><p><br style="color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; font-size: 16px; text-align: justify;"></p>',to_date('2021/06/09','YYYY/MM/DD'),1,0,'n',0,'market.jpg');
Insert into SCOTT.BOARD values (6,'경험을 소비하는 공간의 시대','<p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><b>지역이 있는 공간: 하이퍼 로컬</b><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">첫째, 하이퍼 로컬 Hyper-Local이 있다. ‘아주 좁은 범위의 특정 지역에 맞춘’이란 뜻으로 특정 지역, 동네 자체를 경험하고 소비하게 해야 한다는 것이다. 단순히 관광하듯 한곳에 머무는 것이 아니라 한 지역의 고유한 역사, 문화, 예술, 환경 등을 기반으로 지역색을 경험하게 해야 한다. 최근 이러한 경향은 ‘여행’을 통해 두드러지고 있다.&nbsp;</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">대표적인 예로 일본 교토를 꼽을 수 있다. 왜 도쿄가 아니고 교 토일까? 도쿄는 콘텐츠가 풍부하지만, 크고 높은 건물들이 만들어내는 ‘도시 풍경’이 익숙한 이들에게 그다지 매력적이지 않다. 그에 반해 교토는 일본에서 유일하게 전통 문화를 옛 모습 그대로 보존하고 있으며, 이를 현대의 브랜드와 다양하게 결합시켜 독특한 풍경을 만들어냈다.&nbsp;</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">2018년에는 애플스토어와 블루보틀이 교토에 문을 열었고, 2019 년에는 일본 최초로 에이스호텔이 진출하는 등 전세계 디벨로퍼들이 앞다투어 자리 잡고 있다. 교토시는 이들을 단순히 유치하는 데에만 그치지 않고, 지역색과 문화를 공간에 담아낼 수 있도록 일본 로컬 건축가와의 협업을 지원하거나 지역 가이드를 제안한다. 같은 브랜드라도 교토에서만 경험할 수 있는 공간을 조성함으로써 사람들이 더욱 찾아갈 수밖에 없게 된 것이다.&nbsp;</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">애플스토어 교토점은 3층으로 구성된 공간으로 전통적인 요소가 곳곳에 배어 있다. 가장 눈에 띄는 것은 일본식 등불의 모습을 차용해 만든 외관이다. 일반적으로 상업 공간은 소비자들이 방문하는 매장 내부에 집중해 색깔을 담기 마련인데, 건물 외관 자체를 전통의 멋을 드러내는 요소로 활용한 것이다. 이런 시도를 통해 주변 풍경에 자연스럽게 녹아들 뿐만 아니라, 전통과 현대가 교차하는 랜드마크를 만들어냈다.</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><img src="https://lh3.googleusercontent.com/sFT2QKHI19iC6fcO1vb7-vhl5wyA5-mOmX1g3KBi92yvewQVAuvXgPeGAbV4WAYNMyyVrSQ0UjdJ9ZaJckQjIVqY4w8=w2048" style="width: 700px;"></p>',to_date('2021/06/09','YYYY/MM/DD'),1,0,'n',0,'house.jpg');
Insert into SCOTT.BOARD values (7,'바다가 키운 사람들','<p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><span style="font-size: 1em;">바다를 곁에 두고 사는 이들에게 바다는 생업의 터전이자 그리움의 근원이다. 바다를 떠나지 못하는 것은 물론이고, 떠났다가도 다시 돌아온다. 강원도 바다 곁에서 자신의 길을 묵묵히 걸어온 속초의 배 목수와 삼척의 해녀를 만났다.</span></p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><br></p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><img src="https://lh3.googleusercontent.com/GWGCcYgZkQ09JohSMEY8UnqtGDyywdchz6cvutLR1C-Ed-dpkVrGqRkD0s_5Z44b5Glx8d7bGcvU1y8w9au3XAhq1_E=w2048" style="font-size: 1em; width: 700px;"><br></p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><br></p><p style="font-size: 1em; margin-top: 0.5rem; line-height: 1.9;"><br style="color: rgb(35, 31, 32); font-family: " noto="" sans="" kr",="" sans-serif;="" text-align:="" justify;"=""></p>',to_date('2021/06/09','YYYY/MM/DD'),4,0,'n',0,'boat.jpg');
Insert into SCOTT.BOARD values (8,'앤틱&빈티지','<p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">번화가의 들뜬 분위기가 한층 가라앉을 때쯤, 색다른 풍경이 발걸음을 붙잡는다. 눈으로 보기엔 나이도 출신도 가늠하기 힘든 가구와 소품으로 가득 찬 ‘이태원 앤틱 가구 거리’ 이야기다. “젊었을 때 명품 휘두를 거 다 휘둘러본 분들이 마지막 선택으로 앤틱 가구를 수집한다”는 한 상인의 말처럼 이 거리엔 고가의 제품이 넘쳐난다. 그러나 단순한 명품 거리이기 이전에 동네의 역사와 주민의 삶이 고스란히 녹아 있는 곳이다.</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><img src="https://lh3.googleusercontent.com/SjLhdbT4D-AU-xvw6Z-cbPJTKGfpYJI6_uOsIDUqJ41vwOlRr0aPw9_FSirb4sJP3arFDfhrD60SeV74DrKkZTghB8o=w2048" style="width: 700px;"></p>',to_date('2021/06/09','YYYY/MM/DD'),13,0,'n',0,'antique.png');
Insert into SCOTT.BOARD values (9,'스터디파이','<p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">어제와 다를 바 없는 오늘을 보내고 온 직장인의 심경은 복잡하다. 지금보다 나은 상황을 모색하려는 자기계발에 대한 욕구와 그 모든 것으로부터 눈감아버리게 만드는 긴 하루의 피로 때문이다. 자신의 삶과 커리어를 개선하고자 하는 이들의 간절한 열망은 이를 해결할 수단과 만났을 때 강력한 의지로 전환된다. 2018년 9월 성인교육 업계에 등장해 기존의 온라인 교육 서비스와 차별화된 방식을 선보인 스터디파이는, 같은 해 10월 12억 원 규모의 투자 유치에 성공한 데 이어 설립 2년 차에는 이미 신뢰할 만한 온라인 스터디 플랫폼으로 자리 잡았다. 온라인 툴과 긴밀하게 결합한 이들의 교육 방식은 자신에게 주어진 한정된 시간을 더욱 효율적으로 사용하려는 젊은 층의 욕구와 만나 21세기에 걸맞은 자기계발법을 보여주고 있다.</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><img src="https://lh3.googleusercontent.com/_CLyO07g-Nqv6F8t_uFMOxAaG8oJY2sUAJN5hNlaTUzXevv6u7d37vFRNcN1IUHv3y2PgAUKY2vNPpegdXQ6fjtLHxc=w2048" style="width: 700px;"></p>',to_date('2021/06/09','YYYY/MM/DD'),16,1,'n',0,'study.jpg');
Insert into SCOTT.BOARD values (10,'고성','<p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;">고성은 강원도 최북단에 있는 ''작은'' 군이다. 이는 물리적인 면적(664.34km²)만의 의미가 아니다. 한국전쟁 이후 휴전선이 한반도를 가로지르면서 전체 면적의 절반 가까이만 현재 남한의 고성군이 됐다. 고성은 동해를 접한 여섯 개 시군 가운데 인구 증가율이 가장 저조할 뿐 아니라, 지정학적 위치로도 수도권 접근성이 떨어지는 편이다. 그러나 대부분의 청년이 서울이나 대도시로 떠나는 이곳에도 조금씩 변화의 바람이 일고 있다. 바다에서 태어나 잠시 바다를 떠났다가 다시 바다로 돌아오는 젊은이들 덕분이다.&nbsp;</p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><br></p><p style="margin-top: 0.5rem; line-height: 1.9; color: rgb(35, 31, 32); font-family: &quot;Noto Sans KR&quot;, sans-serif; text-align: justify;"><img src="https://lh3.googleusercontent.com/OcqL51F09RyCoHunM3qV7shzy9vX6nwFZnofBEQjaXGkaXIIauWnOfpepUNc_82A0_5OuD8q4pmXGFWb7vVzzR72Gg=w2048" style="width: 700px;"></p>',to_date('2021/06/09','YYYY/MM/DD'),142,1,'n',0,'beach.png');


select * from board;

-- 게시판(스토리) 임시저장
drop table bdSave;
CREATE TABLE bdSave
(
    bs_no    NUMBER CONSTRAINT bdSave_bs_no_PK PRIMARY KEY NOT NULL,
    thumbnail VARCHAR2(100),
    title    VARCHAR2(50),
    content    VARCHAR2(4000),
    reg_date    DATE NOT NULL,
    mno    NUMBER constraint bdSave_bs_no_fk references member NOT NULL
);
select * from bdSave;
alter table bdSave modify(title varchar2(100));

-- 게시판 좋아요
drop table bdLikes;
CREATE TABLE bdLikes
(
    mno    NUMBER constraint bdlikes_mno_fk references member NOT NULL,
    bno    NUMBER constraint bdlikes_bno_fk references board NOT NULL
);
select * from bdLikes;

-- 게시판에 댓글(답글 포함)
drop table reply;
CREATE TABLE reply
(
    re_no    NUMBER CONSTRAINT reply_re_no_PK PRIMARY KEY NOT NULL,
    content    VARCHAR2(500) NOT NULL,
    reg_date    DATE NOT NULL,
    ref    NUMBER NOT NULL,
    ref_level    NUMBER NOT NULL,
    ref_step    NUMBER NOT NULL,
    likes    NUMBER default 0,
    del    CHAR(1) default 'n' NOT NULL,
    mno    NUMBER constraint reply_mno_fk references member NOT NULL,
    bno    NUMBER constraint reply_bno_fk references board NOT NULL
);
select * from reply;
-- 댓글 좋아요
drop table rpLikes;
CREATE TABLE rpLikes
(
    mno    NUMBER constraint rplikes_mno_fk references member NOT NULL,
    re_no    NUMBER constraint rplikes_rv_no_fk references reply NOT NULL
);
select * from rvLikes;