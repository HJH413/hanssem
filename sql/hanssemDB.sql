use hanssem;
-- 영문, 숫자는 1byte 한글, 특문은 3byte
-- 미완성 테이블 배송지 목록, 결제


-- 회원 테이블
CREATE TABLE member
(
    member_number        INT AUTO_INCREMENT PRIMARY KEY COMMENT '회원 고유번호',
    member_id            VARCHAR(12)   NOT NULL COMMENT '숫자 영문 포함 최대12글자제한',
    member_pw            VARCHAR(2000) NOT NULL COMMENT '암호화 기준',
    member_name          VARCHAR(30)   NOT NULL COMMENT '한글이름일시 최대 10글자',
    member_email         VARCHAR(103)  NOT NULL COMMENT '이메일은 영문,숫자일시 최대 100글자까지',
    member_phone         VARCHAR(20)   NOT NULL COMMENT '전화번호는 숫자 000-0000-0000 기준',
    member_birth         INT           NOT NULL COMMENT '생일은 숫자만 입력하는 기준',
    member_address       VARCHAR(300)  NOT NULL COMMENT '한글 기준 최대 100글자까지',
    member_gender        INT           NOT NULL COMMENT '0: 남자 1: 여자',
    member_sns           INT           NOT NULL COMMENT '0:비동의 1:동의',
    member_status        INT           NOT NULL COMMENT '0:회원탈퇴 1:회원 2:휴면회원 3:관리자',
    member_register_date TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '회원 등록시 기록되는 시간',
    member_login_date    TIMESTAMP COMMENT '로그인시 업데이트하는거'
);

-- 카테고리 코드 테이블
CREATE TABLE category_code
(
    category_code_number INT AUTO_INCREMENT PRIMARY KEY COMMENT '카테고리 고유번호',
    category_code_name   VARCHAR(60) COMMENT '한글 기준 최대20자'
);

-- 색상 코드 테이블
CREATE TABLE color_code
(
    color_code_number INT AUTO_INCREMENT PRIMARY KEY COMMENT '색상 고유번호',
    color_code_name   VARCHAR(60) COMMENT '한글 기준 최대20자'
);

-- 사이즈 코드 테이블
CREATE TABLE size_code
(
    size_code_number INT AUTO_INCREMENT PRIMARY KEY COMMENT '사이즈의 고유번호',
    size_code_name   VARCHAR(60) COMMENT '한글 기준 최대20자'
);

-- 인테리어 테이블
CREATE TABLE interior
(
    interior_number        INT AUTO_INCREMENT PRIMARY KEY COMMENT '인테리어 고유번호',
    interior_name          VARCHAR(300)  NOT NULL COMMENT '한글 기준 최대 100글자까지',
    interior_register_date TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '인테리어 등록시 기록되는 시간',
    interior_content       VARCHAR(2000) NOT NULL COMMENT '한글 기준 최대 666글자까지'
);

-- 상품 테이블
CREATE TABLE product
(
    product_number                   INT AUTO_INCREMENT PRIMARY KEY COMMENT '상품 고유번호',
    product_name                     VARCHAR(300)  NOT NULL COMMENT '한글 기준 최대 100글자까지',
    product_price                    INT           NOT NULL COMMENT '상품가격은 숫자만 입력하는 기준',
    product_register_date            TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '상품 등록시 기록되는 시간',
    product_content                  VARCHAR(2000) NOT NULL COMMENT '한글 기준 최대 666글자까지',
    product_amount                   INT                    COMMENT '상품 재고량',
    product_sales                    INT                    DEFAULT 0 COMMENT '상품 판매량',
    product_status                   INT                    DEFAULT 1 COMMENT '상품의 상태 0:매진 1:일반 2:특가',
    product_special_end_date         TIMESTAMP              COMMENT '특가 종료일',
    product_special_discount_percent INT                    COMMENT '특가 할인율',

    category_code_number             INT COMMENT '카테고리 코드 번호'

    -- CONSTRAINT FOREIGN KEY (category_code_number) REFERENCES category_code(category_code_number)
);

-- 주소목록 테이블
CREATE TABLE member_address
(
    member_address_number    INT AUTO_INCREMENT PRIMARY KEY COMMENT '배송지 고유번호',
    member_address_status    INT NOT NULL COMMENT '0:배송지 1:기본배송지',
    member_address_post_code INT NOT NULL COMMENT '-없이 숫자만 입력',
    member_address_general   VARCHAR(150) NOT NULL COMMENT '한글 기준 최대 50글자까지',
    member_address_detail    VARCHAR(300) NOT NULL COMMENT '한글 기준 최대 100글자까지',

    member_number            INT COMMENT '회원 고유번호'
);

-- 리뷰 테이블
CREATE TABLE review
(
    review_number        INT AUTO_INCREMENT PRIMARY KEY COMMENT '리뷰 고유번호',
    review_title         VARCHAR(300)  NOT NULL COMMENT '리뷰 제목 100글자까지',
    review_content       VARCHAR(2000) NOT NULL COMMENT '한글 기준 최대 666글자까지',
    review_register_date TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '리뷰 등록시 기록되는 시간',
    review_update_date   TIMESTAMP COMMENT '리뷰 업데이트시 기록되는 시간',
    review_rank          INT           NOT NULL COMMENT '리뷰 점수',
    review_status        INT           NOT NULL DEFAULT 1 COMMENT '0:리뷰삭제 1:리뷰표시',

    member_number        INT COMMENT '회원 고유번호',
    product_number       INT COMMENT '상품 고유번호'
);

-- Q&A 테이블
CREATE TABLE qna
(
    qna_number        INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Q&A 고유번호',
    qna_title         VARCHAR(300)  NOT NULL COMMENT 'Q&A 제목 100글자까지',
    qna_content       VARCHAR(2000) NOT NULL COMMENT '한글 기준 최대 666글자까지',
    qna_register_date TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Q&A 등록시 기록되는 시간',
    qna_update_date   TIMESTAMP COMMENT 'Q&A 업데이트시 기록되는 시간',
    qna_answer        INT           NOT NULL DEFAULT 0 COMMENT '0:미답장 1:답장완료',
    qna_status        INT           NOT NULL DEFAULT 1 COMMENT '0:Q&A삭제 1:Q&A표시',
    
    member_number     INT COMMENT '회원 고유번호',
    product_number    INT COMMENT '상품 고유번호'

);

-- 위시리스트
CREATE TABLE wishlist
(
    wishlist_number        INT AUTO_INCREMENT PRIMARY KEY COMMENT '위시리스트 고유번호',
    wishlist_register_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '위시리스트 등록시 기록되는 시간',
    wishlist_status        INT       NOT NULL COMMENT '0: 위시리스트 삭제 1: 위시리스트 표시',

    member_number          INT COMMENT '회원 고유번호',
    product_number         INT COMMENT '상품 고유번호'
);

-- 결제 테이블
CREATE TABLE purchase
(
    purchase_number            INT AUTO_INCREMENT PRIMARY KEY COMMENT '고유번호',
    purchase_register_date     TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '구매 요청시 등록시 기록되는 시간',
    purchase_status            INT           NOT NULL COMMENT '결제 상태 0:미입금 1:입금완료 2:카드결제 3:카카오결제',
    purchase_delivery_status   INT           NOT NULL COMMENT '배달 상태 0:배송전 1:배송중 2:배송완료',
    purchase_recipient         VARCHAR(30)   NOT NULL COMMENT '수령인 한글기준 최대 10글자',
    purchase_recipient_address VARCHAR(300)  NOT NULL COMMENT '한글 기준 최대 100글자까지',
    purchase_recipient_email   VARCHAR(100)  NOT NULL COMMENT '영어 기준 최대 100글자까지',
    purchase_recipient_phone   VARCHAR(20)   NOT NULL COMMENT '전화번호는 숫자 000-0000-0000 기준',
    purchase_price             INT           NOT NULL COMMENT '결제금액은 숫자만 입력하는 기준',
    purchase_amount            INT           NOT NULL COMMENT '주문 수량',
    purchase_delivery_date     TIMESTAMP              COMMENT '배송 출발시 기록되는 시간',

    member_number          INT COMMENT '회원 고유번호',
    product_number         INT COMMENT '상품 고유번호'
);


-- 이미지 테이블
CREATE TABLE image
(
    image_number           INT AUTO_INCREMENT PRIMARY KEY COMMENT '이미지 고유번호',
    image_register_date    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '이미지 등록시 기록되는 시간',
    image_path             VARCHAR(2000) NOT NULL COMMENT '저장된 이미지 파일 경로',
    image_file_name        VARCHAR(2000) NOT NULL COMMENT '이미지 파일명',
    image_rename_file_name VARCHAR(2000) NOT NULL COMMENT '이미지 파일의 수정된 파일명',
    image_code_number      INT           NOT NULL COMMENT '이미지 코드 1:상품이미지 2:인테리어 이미지',

    product_number         INT COMMENT '상품 고유번호',
    interior_number        INT COMMENT '인테리어 고유번호'
);

-- 인테리어 상품 테이블
CREATE TABLE interior_product
(
    interior_product_number    INT AUTO_INCREMENT PRIMARY KEY COMMENT '인테리어 상품 고유번호',
    interior_product_position  VARCHAR(2000) NOT NULL COMMENT '인테리어 이미지상의 좌표값',

    interior_number            INT COMMENT '등록하는 인테리어 고유번호',
    product_number             INT COMMENT '등록하는 상품 고유번호'
);

-- 카테고리의 사이즈 테이블
CREATE TABLE category_size
(
    category_size_number INT AUTO_INCREMENT PRIMARY KEY COMMENT '인테리어 상품 고유번호',

    size_code_number     INT COMMENT '등록하는 사이즈 고유번호',
    category_code_number INT COMMENT '등록하는 카테고리 고유번호'
);

-- 상품 사이즈의 색상 테이블
CREATE TABLE product_size_color
(
    product_size_color_number INT AUTO_INCREMENT PRIMARY KEY COMMENT '인테리어 상품 고유번호',

    product_number            INT COMMENT '등록하는 상품 고유번호',
    size_code_number          INT COMMENT '등록하는 사이즈 고유번호',
    color_code_number         INT COMMENT '등록하는 색상 고유번호'
);

-- 이미지의 색상 테이블
CREATE TABLE image_color
(
    image_color_number INT AUTO_INCREMENT PRIMARY KEY COMMENT '인테리어 상품 고유번호',
    
    image_number       INT COMMENT '등록하는 이미지 고유번호',
    color_code_number  INT COMMENT '등록하는 색상 고유번호'
);

