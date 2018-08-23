```
1 / 36
```
_Document Updated: 30 August 2016_

# KASIKORN BANK

# K-Payment Gateway

# Merchant Integration Guide

## Version 7.1. 6 /201 6


## Table of Contents


```
3 / 36
```
_Document Updated: 30 August 2016_

**Executive Summary**

This document provides comprehensive information for K-Payment Gateway merchants on
how to connect their Web site to K-Payment Gateway Service and how to integrate technically.

K-Payment Gateway is tightly integrated with 3D Secure enabled MPI (Merchant Server
Plug-in) and therefore K-Payment Gateway merchants can enjoy the highest level of security
standardized by Visa and MasterCard International.

K-Payment Gateway communicates with merchant before accepting credit card details
from cardholders. After successful communication with the e-commerce merchant,
K-Payment Gateway accepts credit card details from the cardholder and communicates with MPI,
Visa/ MasterCard Directory, Credit Card Host and Visa Net/Bank Net respectively depending on the
credit card‟s status. Entire message flow is secured by 128-bit SSL security protocol.

_Note: This document may be revised from time to time and merchants are advised to download
the latest available documents from Merchant Reporting System._

```
E-Commerce merchants are not allowed to enter cardholder‟s card information themselves.
All card details must be input by cardholder.
```

```
4 / 36
```
_Document Updated: 30 August 2016_

**Chapter 1 - Message Flow (3-D Secure**

**Environment)**

#### Case 1 Customer Using Credit Card from 3D Secure Card Issuer

1. Cardholder visits merchant Web site and clicks check out button.
2. Merchant assembles transaction data and sends to K-Payment Gateway‟s payment Screen.
3. K-Payment Gateway sends transaction details to MPI (Merchant Plug in).
4. MPI sends transaction details to Visa/ MasterCard Directory to locate ACS (Access Control
    Server)
5. Visa/MasterCard Directory locates ACS server
6. MPI redirects cardholder to ACS server URL, separate into 2 cases:
    a. In case the customer has not registered 3D Secure, the system will show ADS (Activate
       During Shopping) screen for the customer to register by input security information for
       validate the ownership of the credit card
    b. In case the customer has registered 3D Secure, the system will show password screen
7. Cardholder enters password and ACS generates ECI, CAVV and XID
8. MPI obtains ECI, CAVV and XID. ECI = 05/ UCAF = 2 (Fully authenticated) and sends them to
    K-Payment Gateway
9. K-Payment Gateway compiles ECI, CAVV and XID in the ISO8583 message and sends to credit
    card host
10. Credit card host sends out transaction message to VISA Net/ Bank Net
11. VISA Net/ Bank Net finds Issuer host and gets approval
12. VISA Net/ Bank Net sends response code and approval code (if any) back to Acquirer‟s credit
    card host
13. Acquirer‟s credit card host forwards ISO message from Visa Net/Bank Net to K-Payment
    Gateway
14. K-Payment Gateway interprets ISO message and displays transaction results for cardholder
15. K-Payment Gateway posts transaction results for Merchant


```
5 / 36
```
_Document Updated: 30 August 2016_

#### Case 2 Customer Using Credit Card from Non-3D Secure Card Issuer

1. Cardholder visits merchant website and clicks check out button.
2. Merchant assembles transaction data and sends to K-Payment Gateway‟s payment screen.
3. K-Payment Gateway sends transaction details to MPI (Merchant Plug in)
4. MPI sends transaction details to Visa/MasterCard Directory to locate ACS (Access Control
    Server)
5. Visa/MasterCard Directory locates ACS server
6. Visa/MasterCard Directory responds with enrollment status “N” as issuer is not
    participating in VbV/ SecureCode or ACS server responds with enrollment status “N” as
    cardholder is not registered/enrolled with Verified by Visa/ MasterCard SecureCode.
7. MPI generates ECI and XID. ECI = 6 or UCAF = 1 (Not enrolled) and sends them to K-
    Payment Gateway
8. K-Payment Gateway compiles ECI and XID in the ISO8583 message and sends to credit
    card host.
9. Credit card host sends out transaction message to VISA Net/ Bank Net.
10. VISA Net/ Bank Net finds Issuer host and gets approval.
11. VISA Net/ Bank Net sends response code and approval code (if any) back to Acquirer‟s
    credit card host
12. Acquirer host forwards ISO message from Visa Net/ Bank Net to K-Payment Gateway.
13. K-Payment Gateway interprets ISO message and displays transaction results for
    cardholder.
14. K-Payment Gateway posts transaction results for Merchant.


```
6 / 36
```
_Document Updated: 30 August 2016_

**Chapter 2 - Using K-Payment Gateway Service**

1) Merchant fills in application form to use K-Payment Gateway Service

```
a) Full payment Merchant: Cardholders can make payment in full amount of transaction for
goods/services through K-Payment Gateway for 36 Currencies (upon to merchant‟s
request). There are 2 types of currency transaction which are MCC- Multi Currency and
DCC- Dynamic Currency Conversion
```
```
b) Smartpay Merchant: Cardholders who use KBank Credit Card can make payment for
goods/services with installment plan with K-Payment Gateway starts with 3 to 10 months.
Merchant has to apply K-Payment Gateway as a Smartpay Merchant.
```
c) CUP – China Union Pay acceptance Merchant

d) AMEX - AMERICAN EXPRESS acceptance Merchant

2) KBank checks Merchant‟s documents and makes approval. For approved Merchant, KBank will
provide the following to Merchant.

#### a) 15 digit Merchant ID for Merchant reference when submitting transactions to KBank

#### b) 8 digit Terminal Number for reference to Terminal ID

Merchant will receive a secure envelope containing Username and Password for Merchant to login
to Online Merchant Report. In the event merchant has not received this information, please
contact K-Biz Contact Center 02 888 8822 press 3 , 3 , 6 , 3 or e-mail to

#### ecommerce@kasikornbank.com.

```
c) Merchant may login at https://rt05.kasikornbank.com/paymentgateway to perform the
following:
```
- Check Transaction List
- Search Transaction
- Perform Settlement
- Void Transaction
- Query Summary Report
- Email to Customer Support
- Obtain Sample Code to Integrate
- Change Password
- Download Integration Guide and Online Merchant Report Manual Documents

3) Modify Merchant‟s Program Code in Website to integrate with K-Payment Gateway. Example
of Code can be seen in Online Merchant Report under Menu “Code Library”.

4) Test the connection and transaction via web browser at

- URL: https://rt05.kasikornbank.com/pgpayment/payment.aspx
    x Suitable for **Visa, MasterCard and JCB** card acceptance
    x This URL is for making transaction through Personal Computer and Notebook with
       any Browser for example Internet Explorer version 6.0 or above, Netscape
       Navigator, Google Chrome, Safari or Mozilla Firefox.


```
7 / 36
```
_Document Updated: 30 August 2016_

- URL: https://rt05.kasikornbank.com/mobilepay/payment.aspx
    x Suitable for **Visa, MasterCard and JCB** card acceptance
    x This URL is for making transaction through Smart Phone such as iPhone, Android
       BlackBerry or Personal Computer and Notebook which K-Payment Gateway is able
       to detect the device of each transaction and display the proper screen for them.
- URL: https://rt05.kasikornbank.com/pggroup/payment.aspx
    x Suitable for **Visa, MasterCard, JCB, CUP (China Union Pay) and AMEX**
       **(AMERICAN EXPRESS)** card acceptance
    x This URL is for making transaction with CUP-China Union Pay and AMEX-
       AMERICAN EXPRESS card which is suitable for Personal Computer and Notebook
       with any Browser for example Internet Explorer version 6.0 or above, Netscape
       Navigator, Google Chrome, Safari or Mozilla Firefox.

Note

* Please see Chapter 4 for detailed description of how to integrate the system

**Chapter 3 - Recommended Minimum Configuration**

**Merchant’s Server Minimum Configuration**

K-Payment Gateway connects with merchant‟s website with HTML language. So
K-Payment Gateway can support many kinds of merchants‟ server, for example, UNIX, Windows,
Linux, etc.

Incase merchants would like to get the approval result from KBank in real-time, the
merchants must have SSL System, at least 128 Bits from trusted certification authorities (e.g.
Verisign, Entrust) (TLS1.1 or TLS1.2)

Merchant needs to have the basic knowledge of HTML 1.1 syntax and languages
especially:
x How to write HTML FORM POST
x How to receive HTML FORM POST

**Cardholder’s Computer Configuration**
Cardholders can use any computer specification, which can connect to the Internet and
have Browser program, for example, Internet Explorer 6.0 up, Netscape, Google Chrome, Safari or
Mozilla Firefox.


```
8 / 36
```
_Document Updated: 30 August 2016_

**Chapter 4 – Downloading & Integrating Code**

Code Library can be accessed from “Code Library” button in the Menu of the Online Merchant
Report to view the following screen.

Merchants may copy and paste code from Code Library for immediate use from the above screen.
Code will show Merchant ID, Terminal ID and RESPURL information assigned by the system and
show in the sample format as follows:

<form name="sendform" method="post"
action="https://rt05.kasikornbank.com/pgpayment/payment.aspx">
<INPUT type="hidden" id=MERCHANT2 name=MERCHANT2 value="492100005018001">
<INPUT type="hidden" id=TERM2 name=TERM2 value="20388896">
<INPUT type="hidden" id=AMOUNT2 name=AMOUNT2 value="000000000100">
<INPUT type="hidden" id=URL2 name=URL
value="https://app1/inetshoppingmall/custresp.asp">
<INPUT type="hidden" id=RESPURL name=RESPURL
value="https://thipun/inetshoppingmall/pmgwresp.asp">
<INPUT type="hidden" id=IPCUST2 name=IPCUST2 value="1.3.101.61">
<INPUT type="hidden" id=DETAIL2 name=DETAIL2 value="Toshiba Model CM203">
<INPUT type="hidden" id=INVMERCHANT name= INVMERCHANT value="000000000012">
<INPUT type="hidden" id=FILLSPACE name= FILLSPACE value="Y"> <!--Optional-->
</form>
</body>
</html>


```
9 / 36
```
_Document Updated: 30 August 2016_

**Chapter 5 – Submitting Transaction to K-Payment**

**Gateway**

```
Figure 1: Message Flow between Merchant and K-Payment Gateway
```
**Step 1: Check out from merchant website (Need Merchant Action)**

Cardholder/customer visits Merchant Website and chooses a product or adds products to the
shopping cart.

**Step 2: Redirect to K-Payment Gateway (Need Merchant Action. Refer to Chapter 4 for
sample code and screens)**

Cardholder/customer checks out from the merchant website and merchant website redirects
cardholder to K-Payment Gateway with pre-agreed parameters. The following parameters need to
be passed to K-Payment Gateway to process the transaction with Method = POST.

For more security in sending these parameters, merchant **must** use **MD5 Checksum method** to
encrypt them before send post to KBank as steps below.
a. Arrange all parameters in the following table from no. 1 to no. 11 to in one line
consecutively.
b. Add one more parameters “MD5 Secret Key” at the end of the message from a. which
KBank will provide merchant. (Merchant must keep „MD5 Secret Key‟ as secret
between merchant and Kbank. Please strictly do not reveal this key to any other
persons who are not concerned.)
c. Hash message from b. with MD5 method to get MD5 Hash. See more detail how to
hash at [http://md5encryption.com/.](http://md5encryption.com/.) Please use this MD5 Hash as a no. 12 parameters in
table called CHECKSUM.
d. There is value of CHECKSUM send post back to merchant‟s URL2 from KBank as MD
hashing as well.


```
10 / 36
```
_Document Updated: 30 August 2016_

```
No Variable Data Type Length Required/ Optional Description Remark
```
1 **MERCHANT2** Numeric 15 Required Merchant ID. Issued by KBanke.g. 401001234567001^

2 **TERM2** Numeric 8 Required Terminal ID. Issued by KBe.g. 70123456ank

3 **AMOUNT2** Numeric 12 Required Total amount of purchased order

```
No decimal (multiple of 100)
e.g. key in
000000078125 = 781.
```
4 **URL2** Character 255 Required

```
URL where cardholder will
be re-directed back to
merchant‟s Web site and
KBank returns variables to
when cardholder clicks „ Go
Back to Merchant Web
site ‟ (Success page) or
„ Continue ‟ (Reject page)
```
```
http://www............... or
https://www...............
Must post to KBank for
support AMEX and CUP card.
```
5 **RESPURL** Character 255 Optional

```
URL where KBank will send
a variable „ PMGWRESP 2 ‟
to merchant‟s server (Back
Office)
```
```
https://www..................
(must be supported- SSL at
lease 128 bits)
```
6 **IPCUST2** Numeric 15 Required IP address of merchant‟s server IP Address e.g. 111.111.111.^

7 **DETAIL2** Character 30 Optional Product Description(A-Z or 0 - 9)

```
Electric Fan – Model XYZ
For support CUP card can
use the symbol that included
minus sign, under line, dot
and bracket ,not available for
others.
```
8 **INVMERCHANT** Numeric 12 Required Invoice No. Issued by Merchant (be a unique number) should^

9 **FIL** (Option) **LSPACE** Character 1 Optional Card type required?

```
Y : Want to know the
transaction‟s card type
N : Do not want
```

```
11 / 36
```
_Document Updated: 30 August 2016_

10

```
SHOPID
(Option for
customized
Payment
template and
SmatPay)
```
```
Character 2 Optional Shop ID. for payment template
```
1. Blank or 00 : Default Eng.
Template
2. TH : Default Thai
Template
3. 01,02,03,... : Specific
Template uploaded (To be
confirmed)
4. 41,42,43,... : SmartPay
Template

11

```
PAYTERM
(Option for
SmartPay)
```
```
Numeric 2 Optional Number of month for installment
```
```
e.g. 3 = 3 Months
6 = 6 Months
10 = 10 Months
(3, 6, ... , 10 Months)
```
12

```
CHECKSUM
(Require for
security)
```
```
Character 32 Required MD5 Secure Hash
```
```
Example:
<form name="sendform" method="post"
action="https://rt05.kasikornbank.com/pgpayment/payment.aspx">
<input type="hidden" id=MERCHANT2 name=MERCHANT2 value="492100005018001">
<input type="hidden" id=TERM2 name=TERM2 value="20388896">
<input type="hidden" id=AMOUNT2 name=AMOUNT2 value="000000150099">
<input type="hidden" id=URL2 name=URL
value="https://www.xxx.com/shopping/custresp.asp">
<input type="hidden" id=RESPURL name=RESPURL
value="https://www.xxx.com/shopping/pmgwresp.asp">
<input type="hidden" id=IPCUST2 name=IPCUST2 value="111.111.111.205">
<input type="hidden" id=DETAIL2 name=DETAIL2 value="Electric Fan - Toshiba Model CM203">
<input type="hidden" id=INVMERCHANT name=INVMERCHANT value="000000000012">
<input type="hidden" id=FILLSPACE name=FILLSPACE value="Y"> <!--Option-->
<input type="text" name="SHOPID" id="SHOPID" value="00"> <!--Option-->
<input type="text" id=Payterm2 name=Payterm2 value="3"> <!--Option-->
<input type="text" id="CHECKSUM" value="4aa8447bfdd91f31f4cbed691397c33f">
</form>
</body>
</html>
```
```
Remark
```
```
Checksum is arrange data and MD5 encryption, please make sure all data has been arranged in
this order (can skip if anyone don‟t have)
In form: MERCHANT2 + TERM2 + AMOUNT2 + URL2 + RESURL + IPCUST2 + DETAIL2 +
INVMERCHANT + FILLSPACE + SHOPID + PAYTERM2 + MD5 Key
then MD5 encryption with all arranged data.
```

```
12 / 36
```
_Document Updated: 30 August 2016_

Purchase information will be displayed on the screen for cardholder as follows.

a) Full Payment Transaction

When cardholder enters credit card number, Security Code (CVV2/CVC2), card expiration date,
Card Type, Issuer Bank Country‟s Name, and Issuer Bank‟s Name into the appropriate fields then
clicks on “PAY NOW” button, information will be displayed on the following screen for confirmation.


```
13 / 36
```
_Document Updated: 30 August 2016_

b) SmartPay Payment Transaction

Cardholder can select prefer term of payment and enters credit card number, Security Code
(CVV2/CVC2), card expiration date, Card Type, Issuer Bank Country‟s Name, and Issuer Bank‟s
Name into the appropriate fields then clicks on “PAY NOW” button, information will be displayed on
the following screen for confirmation.


```
14 / 36
```
_Document Updated: 30 August 2016_

c) For CUP- China Union Pay with UPOP (Union Pay Online Payment) acceptance

Merchants have to integrate by METHOD=POST with K-Payment Gateway as well but have
to change to post to https://rt05.kasikornbank.com/pggroup/payment.aspx. Merchant‟s website
will Re-Direct to KBank card type page and then customer can select payment with CUP by click at
Pay with UnionPay. K-Payment Gateway will Redirect the page to CUP-UPOP system for
cardholders to enter their card‟s information such as card no., expiry date, CVN2. But for debit
cardholders may enter only card no. and password. Then click to receive SMS of Dynamic
Verification Code. The SMS will send to the registered phone no. for that particular card.
Customer now enter the code and input the text from picture then click payment. If payments are
success customer will see success page then click the button to redirect back to K-Payment
Gateway.


```
15 / 36
```
_Document Updated: 30 August 2016_

d) For AMEX - AMERICAN EXPRESS


```
16 / 36
```
_Document Updated: 30 August 2016_

Merchants have to integrate by METHOD=POST with K-Payment Gateway as well but have
to change to post to https://rt05.kasikornbank.com/pggroup/payment.aspx. Merchant‟s website
will Re-Direct to KBank card type page and then customer can select payment with AMEX by click
at Pay with AMEX. K-Payment Gateway will Redirect the page for cardholders to enter their card‟s
information such as card no., Effective Date, Expiry Date, Card Holder First Name, Card Holder
Last Name, Billing Address, Email, Billing ZIP Code and Billing Telephone Number. Then click “PAY
NOW” button to redirect to confirmation page. After that click “CONTINUE” button. If payments
are success customer will see success page.


            - 2 /
- Document Updated: 30 August
   - Table of Contents
   - Executive Summary
   - Chapter 1 – Message Flow (3D-Secure Envirionment)
   - Chapter 2 – Using K-Payment Gateway Service
   - Chapter 3 – Recommended Minimum Configuration
   - Chapter 4 – Downoloading & Integration Code
   - Chapter 5 – Submitting Transaction to K-Payment Gateway
      - Step 1: Check out from Merchant website
      - Step 2: Redirect to K-Payment Gateway
      - Step 3: Verified by Visa/ MasterCard SecureCode
      - Step 4: System checking for Authorization
      - Step 5: Transaction Result and
         - x Return after clicking at “Go Back to Merchant Website” Return Message back to Merchant Website
         - x Return results in real time (SSL required)
      - Step 6: Checking Data accuracy
   - Appendix A PMGWRESP Format
   - Appendix B Currency Code
   - Appendix C Response Code
   - 17 /
- Document Updated: 30 August


```
18 / 36
```
_Document Updated: 30 August 2016_

#### Step 3: Verified by Visa/ MasterCard SecureCode

K-Payment Gateway communicates with MPI (Merchant Server Plug-In) to perform authentication
using VISA3D Environment. MPI communicates with Visa Directory Server or MasterCard Directory
Server. Cardholder who is currently enrolled with Verified by Visa will be prompted to enter a
password in the appropriate field on his/her issuing bank‟s page as displayed in the following
screen.

**Note:** Verified by Visa cardholders enrolled with other Verified by Visa card issuers may see a similar screen.


```
19 / 36
```
_Document Updated: 30 August 2016_

#### Step 4: System checking for Authorization

Based on the response from VISA3-D Environment (MPI), K-Payment Gateway sends authorization
request to credit card host. Credit card host communicates with VISA NET or MasterCard Bank
NET. During this process the following screen will be displayed.

**Step 5: Transaction Result and Return Message back to Merchant Website (Need
Merchant Action)**

K-Payment Gateway displays the transaction results on screen for the cardholder as follows.

- Transaction approved

a) Full Payment Transaction


```
20 / 36
```
_Document Updated: 30 August 2016_

b) SmartPay Payment Transaction

```
c) CUP – UPOP Transaction
```

```
21 / 36
```
_Document Updated: 30 August 2016_

```
d) AMEX Transaction
```

```
22 / 36
```
_Document Updated: 30 August 2016_

- Transaction declined
Cardholder can click at Pay again to continue make transaction with same invoice no. for 3 times.

a) Full Payment Transaction

b) SmartPay Payment Transaction


```
23 / 36
```
_Document Updated: 30 August 2016_

```
Transaction result return to Merchant Website, there are 2 methods
```
```
x Return after clicking at “Go Back to Merchant Website”
```
```
After the cardholder clicks “Go Back to Merchant Website” button (in case of successful
transaction) or “Continue” button (in case of unsuccessful transaction), the Bank‟s transaction
result page will redirect the cardholder to URL the merchant submitted to the Bank (URL2
variable). The Bank will send the transaction result with the following parameters to the merchant
(Post method), as long as the cardholder remains on the same browser session.
```
**No. Variable Data Type Length Description Remark**

```
1 HOSTRESP Numeric 2 Response Code 00 = Approved,
Others = Not Approved (Please
see detail in Appendix C.)
2 REFCODE Character 12 Kbank‟s reserved variable Reserved
(e.g. XXXXXXXXXXXX)
```
```
3 AUTHCODE Character 6 Authorize Code In case of approved response
```
```
4 RETURNINV Character 12 Invoice No. 000000000012
```
```
5 UAID
(RESERVED - not
use)
```
```
Character 36 Kbank‟s reserved variable Reserved
(e.g.
XXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXX)
```
```
6 CARDNUMBER Character 16 First 4 and Last 4 of
Credit Card Number
```
```
4234XXXXXXXX9999
```
```
7 AMOUNT Numeric 12 Transaction amount sent
to host (2-digit Decimal)
* JPY: no decimal
KRW: no decimal
```
```
e.g. 000000004155
= 41.55 USD
= 4155.00 JPY
= 4155.00 KRW
```
```
8 THBAMOUNT
(Option for DCC
Transaction)
```
```
Numeric 12 Amount that merchant
posts on Web site
(2-digit decimal)
```
```
In case of cardholder chooses
THB currency, this field will be
“XXXXXXXXXXXX”
```
```
9 CURISO Numeric 3 Transaction currency e.g. 764=Baht/ 840 = USD/
036 = AUD/978 =EUR/
392=JPY/ 826 =GBP/
554 =NZD/ 344=HKD/
SGD=702/ CHF= 756
10 FXRATE
(Option for DCC
Transaction)
```
```
Numeric 12 Exchange rate of
transaction (4-digit
decimal)
```
```
e.g. 000000283155 = 28.3155
In case of cardholder chooses
THB currency, this field will be
“XXXXXXXXXXXX”
```
```
11 FILLSPACE Character 20 Type of Card
(if „FILLSPACE‟ variable
set to „Y‟)
```
```
e.g. KBANKCARDXXXXXXXXXXX
VISACARDXXXXXXXXXXXX
MASTERCARDXXXXXXXXXX
JCBCARDXXXXXXXXXXXXX
CUPCARDXXXXXXXXXXXXX
AMEXCARDXXXXXXXXXXXX
12 MID
(Option for
SmartPay)
```
```
Numeric 15 Issued by Kbank e.g. 401004111111001
```

```
24 / 36
```
_Document Updated: 30 August 2016_

**No. Variable Data Type Length Description Remark**

```
13 PLANID
(Option for
SmartPay)
```
```
Numeric 3 Plan ID Value for
Smartpay
```
```
Always = 999
```
##### 14 PAYMONTH

```
(Option for
SmartPay)
```
```
Numeric 2 Number of month for
installment
```
```
e.g. 0 3 = 3 Months
( 0 3,04,05,..., 10 Months)
```
```
15 INTTYPE
(Option for
SmartPay)
```
```
Numeric 1 Interest calculation
method for smart
payment
```
```
1 = Effective Rate
2 = Flat Rate
3 = Progressive Rate
16 INTRATE
(Option for
SmartPay)
```
```
Numeric 6 Interest rate charged for
smart payment per month
(3-digit Decimal)
```
```
e.g. 000800 = 0.80%
```
```
17 AMTPERMONTH
(Option for
SmartPay)
```
```
Numeric 9 Amount payment per
Month for smart payment
(2-digit Decimal)
```
```
e.g. 000341333 =3413.33 THB
```
```
18 TOTALAMT
(Option for
SmartPay)
```
```
Numeric 12 Total amount include
Interest amount for smart
payment (2-digit
Decimal)
```
```
e.g. 000001024000 = 10,240.00
THB
```
```
19 MANGFEE
(Option for
SmartPay)
```
```
Numeric 5 Management Fee for
smart payment (2-digit
Decimal)
```
```
e.g. 00000 = 000.00
```
```
20 INTMODE
(Option for
SmartPay)
```
```
Numeric 2 Mode for Interest
payment acceptance
```
```
01 = Merchant pay Int.
02 = Customer pay Int.
03 = Supplier pay Int.
04 = Special Int.
21 MD5CHECKSUM Character 32 MD5 Secure Hash Use MD5 Function
```
```
Total
Length
```
##### 230

```
Example in Active Server Page (VBScript):
HostResp = Request.Form("HOSTRESP") show the customer approval list
„00‟= approved
„01‟= not approved
HostRef = Request.Form("REFCODE") reference no. from KBANK
HostAuth = Request.Form("AUTHCODE") authorized code from KBANK
Credit card type used by the customer. KBANK will only send this value to the merchant, if
the Step 4 of „FILLSPACE‟ variable set to „Y‟
```
```
Sample of values returned by the Bank for MCC transactions:
```
```
HOSTRESP=00&RESERVED1=XXXXXXXXXXXX&AUTHCODE=000002&RETURNINV=000000012111
&RESERVED2=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&CARDNUMBER=4072XXXXXXXX4
249&AMOUNT=000000040050&THBAMOUNT=XXXXXXXXXXXX&CURISO= 764 &FXRATE=XXXXXXXXX
XXX&FILLSPACE=VISACARDXXXXXXXXXXXX
--------------------------------------------------------------------------------------
```
```
HOSTRESP=00
RESERVED1=XXXXXXXXXXXX
AUTHCODE=000002
RETURNINV=000000012111
RESERVED2=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
CARDNUMBER=4072XXXXXXXX4249
```

```
25 / 36
```
_Document Updated: 30 August 2016_

AMOUNT=000000040050
THBAMOUNT=XXXXXXXXXXXX
CURISO= 764
FXRATE=XXXXXXXXXXXX
FILLSPACE=VISACARDXXXXXXXXXXXX

**Sample of values returned by the Bank for DCC transactions:**

HOSTRESP=00&RESERVED1=XXXXXXXXXXXX&AUTHCODE=000002&RETURNINV=000000012111
&RESERVED2=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&CARDNUMBER=4072XXXXXXXX4
249&AMOUNT=000000000004&THBAMOUNT=000000000100&CURISO=036&FXRATE=000000283
155&FILLSPACE=VISACARDXXXXXXXXXXXX
--------------------------------------------------------------------------------------

HOSTRESP=00
RESERVED1=XXXXXXXXXXXX
AUTHCODE=000002
RETURNINV=000000012111
RESERVED2=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
CARDNUMBER=4072XXXXXXXX4249
AMOUNT=000000000004 => TXN AMT 2-digit decimal
THBAMOUNT=000000000100 => THB AMT 2-digit decimal
CURISO=036
FXRATE=000000283155 => FX rate 4-digit decimal
FILLSPACE=VISACARDXXXXXXXXXXXX

**Sample of values returned by the Bank for SmartPay transactions:**

HOSTRESP=00&RESERVED1=XXXXXXXXXXXX&AUTHCODE=000002&RETURNINV=000000012111
&RESERVED2=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&CARDNUMBER=4072XXXXXXXX4
249&AMOUNT=000000040050&THBAMOUNT=XXXXXXXXXXXX&CURISO= 764 &FXRATE=XXXXXXXXX

XXX&FILLSPACE=VISACARDXXXXXXXXXXXX&MID=401004999999001&PLANID=999&PAYMONTH
=03&INTTYPE=2&INTRATE=000800&AMTPERMONTH=000003755&TOTALAMT=000000011264&M
ANGFEE=00000& INTMODE=02&MD5CHECKSUM=4aa8447bfdd91f31f4cbed691397c33f
--------------------------------------------------------------------------------------

HOSTRESP=00
RESERVED1=XXXXXXXXXXXX
AUTHCODE=000002
RETURNINV=000000012111
RESERVED2=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
CARDNUMBER=4072XXXXXXXX4249
AMOUNT=000000040050
THBAMOUNT=XXXXXXXXXXXX
CURISO= 764
FXRATE=XXXXXXXXXXXX
FILLSPACE=VISACARDXXXXXXXXXXXX
MID=401004999999001
PLANID=999
PAYMONTH=03
INTTYPE=2
INTRATE=000800
AMTPERMONTH=000003755
TOTALAMT=000000011264
MANGFEE=00000
INTMODE=02
MD5CHECKSUM=4aa8447bfdd91f31f4cbed691397c33f


```
26 / 36
```
_Document Updated: 30 August 2016_

```
x For merchants require to get transaction results in real time (SSL required)
```
```
Merchants can receive transaction information in real time via K-Payment Gateway‟s URL response
sent by the Bank (Step2: “RESPURL” variable). The following parameters will be passed to
merchants in “ PMGWRESP 2 ” variable by POST method.
```
**No. Field Name Type Length Position Description Remark**

```
1 TransCode Numeric 4 1 Transaction Code 0110
```
```
2 Merchant ID Numeric 15 5 Issued by Kbank e.g. 481212111111111
3 Terminal ID Numeric 8 20 Issued by Kbank e.g. 71111111
```
```
4 Shop No Numeric 2 28 Shop Number Always = 00
```
```
5 Currency Code Numeric 3 30 Transaction currency
(See details of Currency
Code in Appendix B)
```
```
e.g.
764 = THB 840 = USD
036 = AUD 978 = EUR
392 = JPY 826 = GBP
554 = NZD 344 = HKD
702 = SGD 756 = CHF
6 Invoice No Numeric 12 33 Unique sent by
merchant
```
```
e.g. 111111111111
```
```
7 Date Numeric 8 45 DDMMYYYY e.g. 20112007
```
```
8 Time Numeric 6 53 HHMMSS e.g. 141222
```
```
9 Card No. Numeric 19 59 16 digits (shift Left) e.g. 4751XXXXXXXX1452XXX
```
```
10 Expired Date Numeric 4 78 YYMM e.g. XXXX
11 CVV2/ CVC2 Numeric 4 82 3 digits (shift Left) e.g. XXXX
```
```
12 TransAmount Numeric 12 86 2 - digit decimal
* JPY: no decimal
KRW: no decimal
```
```
e.g. 000000250099
= 2,500.99 THB, USD
= 250,099 JPY
= 250,099 KRW
13 Response Code Numeric 2 98 Transaction Response
Code
```
```
e.g. Approved = 00
Other = Not approved = (Please
see detail in Appendix C.)
14 Approval Code Alphanumeric 6 100 Transaction Approval
Code (For CUP ,if
declined response code
= XXXXXX)
```
```
e.g. T15415 , 003422
```
```
15 Card Type Numeric 3 106 001=VISA, 002=Master
003=KBank, 004=JCB,
005=CUP, 007=AMEX
```
```
e.g. 001, 002,003,004,005,007
```
```
16 Reference1 Alphanumeric 20 109 Merchant Reference 1
(reserved)
```
```
Reserved (Not use)
```
```
17 Plan ID
(Value for SmartPay)
```
```
Numeric 3 129 Plan ID Value for
Smartpay
```
```
Always = 999
```
```
18 Pay Month
(Value for SmartPay)
```
```
Numeric 2 132 Number of month for
installment
```
```
e.g. 03 = 3 Months
(03,0 4 ,0 5 ...., 10 Months)
```
```
19 Interest Type
(Value for SmartPay)
```
```
Numeric 1 134 Interest calculation
method for smart
payment
```
```
1 = Effective Rate
2 = Flat Rate
3 = Progressive Rate
```
```
20 Interest Rate
(Value for SmartPay)
```
```
Numeric 6 135 Interest rate charged
for smart payment per
month (3-digit Decimal)
```
```
e.g. 000800 = 0.80%
```

```
27 / 36
```
_Document Updated: 30 August 2016_

**No. Field Name Type Length Position Description Remark**

```
21 Amount per Month
(Value for Smart
Pay)
```
```
Numeric 9 141 Amount payment per Month
for smart payment (2-digit
Decimal)
```
```
e.g. 000341333 =3413.33
THB
```
```
22 Total amount
(Value for Smart
Pay)
```
```
Numeric 12 150 Total amount include
Interest amount for smart
payment (2-digit Decimal)
```
```
e.g. 000001024000
= 10,240.00 THB
```
```
23 Management Fee
(Value for Smart
Pay)
```
```
Numeric 5 162 Management Fee for smart
payment (2-digit Decimal)
```
```
e.g. 00000 = 000.00
```
```
24 Interest Mode
(Value for Smart
Pay)
```
```
Numeric 2 167 Mode for Interest payment
acceptance
```
```
01 = Merchant pay Int.
02 = Customer pay Int.
03 = Supplier pay Int.
04 = Special Int.
```
```
25 FX Rate
(Value for DCC)
```
```
Numeric 20 169 Exchange Rate (4-digit
decimal) For DCC
transaction
In case of cardholder finally
chose THB currency, this
field will have
“XXXXXXXXXXXX”
```
```
e.g.
000000414152 = 4 1.4152
```
```
26 THB Amount (Value
for DCC)
```
```
Numeric 20 189 For DCC transaction,
amount that merchant
posts on Web site (2-digit
decimal)
In case of cardholder finally
chose THB currency, this
field will have
“XXXXXXXXXXXX”
```
```
27 Customer Email Alphanumeric 100 209 Customer Email e.g. XXXXXXXXX
```
```
28 Description Alphanumeric 150 309 Product Description e.g. Electric Fan – Model
XYZ103
29 Payer IP Address Alphanumeric 18 459 Payer IP Address (shift left) e.g. 10.152.121.125XXXX
```
```
30 Warning Light Alphanumeric 1 477 R=Red, Y=Yellow,
G=Green, X=Not Support
```
```
e.g. R, Y, G, X
```
```
31 Selected Bank Alphanumeric 60 478 Selected Bank Name e.g. Kasikornbank Public
Company Limited
32 Issuer Bank Alphanumeric 60 538 Bank Name from Card's BIN
Number
```
```
e.g. Kasikornbank Public
Company Limited
```
```
33 Selected Country Alphanumeric 45 598 Selected Country e.g. THA
```
```
34 IP Country Alphanumeric 45 643 IP Address Country e.g. THA
```
```
35 Issuer Country Alphanumeric 45 688 Issuer Bank Country e.g. THA
```
```
36 ECI Numeric 4 733 VbV/SC Parameter VbV = 0005, 0006, 0007
SecureCode = 0000, 0001,
0002
JSecure =0005, 0006,
0007
37 XID Numeric 40 737 VbV Parameter e.g.1251111111111....
```
```
38 CAVV Numeric 40 777 VbV Parameter e.g.1251111111111....
```

```
28 / 36
```
_Document Updated: 30 August 2016_

(^) **Total
Length**

##### 816

```
Sample of MCC transaction Response Message
```
##### PMGWRESP2= 01104921010005900017340000100764000000121362310120 081602424973XXX

##### XXXXX3855XXXXXXXXXXX00000008740000000002001XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

##### XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

##### XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

```
XXXXXXXXXXXXXXXXXXXXXXXXXTest
PaymentXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX1
0.198.205.168XXXXRKasikornbank Public Company
LimitedXXXXXXXXXXXXXXXXXXXXXXXXXSociete
GeneraleXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXTHAXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXFRAXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX00063030303030303030303030303030303
0303030300000000000000000000000000000000000000000
```
```
PMGWRESP2=
0110
492101000590001
73400001
00
764
000000121362
31012008
160242
4973XXXXXXXX3855XXX
XXXX
XXXX
000000087400 => Transaction Amount (2-digit decimal)
00
000002
001
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXX => FX Rate
XXXXXXXXXXXXXXXXXXXX => THB Amount
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXX
Test
PaymentXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
X XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
10.198.205.168XXXX
R
Kasikornbank Public Company LimitedXXXXXXXXXXXXXXXXXXXXXXXXX
Societe GeneraleXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
THAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
FRAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
0006
3030303030303030303030303030303030303030
0000000000000000000000000000000000000000
```
##### ++++++++++++++++++++++++++++++++++++++++++++++++++++++


```
29 / 36
```
_Document Updated: 30 August 2016_

**Sample of DCC transaction Response Message**

**PMGWRESP2=** 01104560010005900017340000600036000000012111310120081534534072XXX
XXXXX4249XXXXXXXXXXX00000000000400000002001XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXX0000000000000028315500000000000000000100XXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXTest
PaymentXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX1
0.198.205.168XXXXRKasikornbank Public Company
LimitedXXXXXXXXXXXXXXXXXXXXXXXXXAustralia and New Zealand Banking Group
LimitedXXXXXXXXXXXXXTHAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXAUSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXX00063030303030303030 303030303030303030303030000000000000000000000000
0000000000000000

PMGWRESP2=
0110
456001000590001
73400006
00
036
000000012111
31012008
153453
4072XXXXXXXX4249XXX
XXXX
XXXX
000000000004 => Transaction Amount (2-digit decimal)
00
000002
001
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXX
00000000000000283155 => FX rate (4-digit decimal)
00000000000000000100 => THB Amount (2-digit decimal)
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXX
Test
PaymentXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
X
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
10.198.205.168XXXX
R
Kasikornbank Public Company LimitedXXXXXXXXXXXXXXXXXXXXXXXXX
Australia and New Zealand Banking Group LimitedXXXXXXXXXXXXX
THAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
AUSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
0006
3030303030303030303030303030303030303030
0000000000000000000000000000000000000000

##### ++++++++++++++++++++++++++++++++++++++++++++++++++++++


```
30 / 36
```
_Document Updated: 30 August 2016_

**Sample of SmartPay transaction Response Message**

**PMGWRESP2=** 0110401004053429001703457760076411042115183821042011152152541176X
XXXXX8981XXXXXXXXXXX00000001100012XXXXXX002XXXXXXXXXXXXXXXXXXXX99910 2000800
0000011880000000118800000002XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXTest
PaymentXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX1
0.198.205.72XXXXXRStandard Chartered Bank (Thai) Public Company LimitedXXXXXXXKasikorn
BankXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXTHAXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXTHAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXTHAX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX0002303030303030303030303030303030
30303030303030303030303030303030303030303030303030

PMGWRESP2=
0110
401004053429001
70345776
00
764
110421142429
21042011
142630
5411XXXXXXXX8981XXX
XXXX
XXXX
000000011000 => Transaction Amount (2-digit decimal)
00
005038
002
XXXXXXXXXXXXXXXXXXXX
999 => Smart Pay: Plan ID.
10 => Smart Pay: Pay Month
2 => Smart Pay: Interest Type
000800 => Smart Pay: Interest rate
000001188 => Smart Pay: Amount per month (2-digit decimal)
000000011880 => Smart Pay: Total Amount (2-digit decimal)
00000 => Smart Pay: Management fee (2-digit decimal)
02 => Smart Pay: Interest Mode
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXX
Test
PaymentXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
X
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
10.198.205.168XXXX
Y
KASIKORNBANK PUBLIC COMPANY LIMITEDXXXXXXXXXXXXXXXXXXXXXXXXX
Kasikorn BankXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
THAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
THAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
THAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
0002
3030303030303030303030303030303030303030
3030303030303030303030303030303030303030


```
31 / 36
```
_Document Updated: 30 August 2016_

**Note:.**

```
i. In case that Merchants need to receive real time result, merchants‟ website is required SSL
certificates.
ii. Merchants need to provide URL and IP. Address to KBank for receiving real time result
through menu Support in Merchant Reporting System.
(https://rt05.kasikornbank.com/paymentgateway/)
iii. In case that Merchants using system and found that some transactions do not receive
Response Message back from KBank, Merchant‟s user can request response message once
again by yourself. Merchant‟s user login with his/her user name and password to Online
Merchant Reporting (https://rt05.kasikornbank.com/paymentgateway/), search for the
transaction and click „Details‟ of that particular transaction.
```
```
There is another pop-up window contains details of that transaction, user has to scroll down
to the end of the page and click at „ Get Transaction Result ‟ then system will send
response message to merchant‟s database again.
```

```
32 / 36
```
_Document Updated: 30 August 2016_

#### Step 6: Checking Data accuracy

After merchants receive result back from K-Payment Gateway, Merchant have to check for data
accuracy once again whether data sent out is matched with received response message.
Merchant‟s system should check these main variables.

1. **Merchant ID.** : Check if received and sent data is the same.
2. **Invoice Number** : Check if received and sent data is the same.
3. **Transaction Amount** : Check if received and sent data is the same.
4. **Response Code** : Check for „00‟ as Authorized or success transaction. If merchant
    receives other response code, the transaction is not authorized or success.
5. Merchants must decrypt response message form KBank with MD5 CheckSum
6. **IP Address** : Check for KBank‟s IP address must be 2 03.146.18.94 only.

If all variables which merchant received are all correct and matched, the result message can be
used for further processing.

Merchant displays transaction results for cardholder. Merchant also can checks for all transactions‟
details and status from Online Merchant Reporting by login with provided user name and password
to this URL https://rt05.kasikornbank.com/paymentgateway/. Merchant continues with delivery
process of services/products on his or her own.

Merchants requiring further information or encountering problems connecting with K-Payment
Gateway system may contact K-Biz Contact Center 02 888 8822 press 3, 3, 6, 3 or e-mail to

#### ecommerce@kasikornbank.com


```
33 / 36
```
_Document Updated: 30 August 2016_

### Appendix A PMGWRESP Format

```
The following data format is only used as referral of merchants which have previously received
variable “ PMGWRESP ” for real time result with 13 fields and 222 characters.
```
**No. Field Name Type Length Position Description Remark**
1 Response Code
Numeric

```
2 1 Result from ISSUER 00 = Approved,
Others = Not Approved
(Please see detail in
Appendix C)
2 Reserved1 Character 12 3 Kbank‟s reserved
variable
```
```
Reserved (i.e.
XXXXXXXXXXXX)
3 Authorize Character 6 15 Authorized Number
from KBANK
```
```
In case of approved
response
4 Reserved2 Character 36 21 Kbank‟s reserved
variable
```
```
Reserved (i.e
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXX)
5 Invoice no. Numeric 12 57 Invoice no. The same value of
INVMERCHANT
6 Timestamp Character 14 69 Transaction date
and time
```
```
e.g 31012008 151245
```
```
7 TransAmount Numeric 12 83 Transaction
amount sent to
host (2-digit
Decimal)
* JPY: no decimal
```
```
e.g 000000004155
= 41.55 USD
= 4155.00 JPY
```
```
8 Reserved3 Character 40 95 Kbank‟s reserved
variable
```
```
Reserved (i.e
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXX)
9 Card Type Character 20 135 Card Type VISACARDXXXXXXXXXXX
10 Reserved4 Character 40 155 Kbank‟s reserved
variable
```
```
Reserved (eg.
XXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXX)
11 THB Amount
Numeric 12 195 For DCC
Transaction only,
Amount that
merchant posts on
Web site (2-digit
decimal)
```
```
In case of cardholder
chooses THB currency, this
field will be
“XXXXXXXXXXXX”
```
```
12 TransCurrency
(ISO)
```
```
Numeric 3 207 Foreign currency e.g 764=Baht/ 840 =
USD/ 036 = AUD/978
=EUR/ 392=JPY/ 826
=GBP/ 554 =NZD/
344=HKD/ SGD=702/
CHF= 756
13 FXRate
(DCC
Transaction)
```
```
Numeric 12 210 For DCC
Transaction only,
Exchange rate of
transaction (4-digit
decimal)
```
```
e.g 000000283155 =
28.3155
In case of cardholder
chooses THB currency, this
field will be
“XXXXXXXXXXXX”
```
```
Length 222
```

```
34 / 36
```
_Document Updated: 30 August 2016_

**Sample of data being sent to merchant
In case of approved transaction:
PMGWRESP=00** XXXXXXXXXXXX 000002 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 0000000
0011431012008143451000000008882 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXVISA
CARDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 000000251400036000
000283033

**In case of not approved transaction:
PMGWRESP=01** XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 000000
00001505022008142906000000000100 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXMAS
TERCARDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXX


```
35 / 36
```
_Document Updated: 30 August 2016_

### Appendix B Currency Code

**No.**

```
Currency ISO
Code
(CURISO)
```
##### CURRENCY

```
No.
```
```
Currency ISO
Code
(CURISO)
```
##### CURRENCY

##### 1 764 THB 19 446 MOP

##### 2 840 USD 20 096 BND

##### 3 978 EUR 21 784 AED

##### 4 392 JPY 22 144 LKR

##### 5 826 GBP 23 050 BDT

##### 6 036 AUD 24 682 SAR

##### 7 554 NZD 25 524 NPR

##### 8 344 HKD 26 586 PKR

##### 9 702 SGD 27 710 ZAR

##### 10 756 CHF 28 608 PHP

##### 11 356 INR 29 634 QAR

##### 12 578 NOK 30 704 VND

##### 13 208 DKK 31 512 OMR

##### 14 752 SEK 32 643 RUB

##### 15 124 CAD 33 410 KRW

##### 16 458 MYR 34 360 IDR

##### 17 156 CNY 35 414 KWD

##### 18 901 TWD 36 048 BHD


```
36 / 36
```
_Document Updated: 30 August 2016_

### Appendix C Response Code

#### Return Code Meaning Recommendation

```
00 Approved Payment Completed
```
```
01 Refer to card issuer Give cardholder contacts issuer bank
```
```
03 Invalid Merchant ID Please contact KBank
```
```
05 Do not honor
```
```
Cardholder input invalid card information. Ex. Expiry
date, CVV2 or card number. Give cardholder contacts
issuer bank.
```
```
12 Invalid transaction Please contact KBank
```
```
13 Invalid Amount Payment amount must more than 0.1
```
```
14 Invalid Card Number Please check all digits of card no.
```
```
17 Customer Cancellation Customers click at cancel button in payment page when
they make transaction. Customers have to make new
payment transaction.
```
```
19 Re-enter transaction Duplicate payment. Please contact KBank
```
```
30 Format Error Transaction format error. Please contact KBank
```
```
41 Lost Card – Pick up Lost Card and Cardholder give up.
```
```
43 Stolen Card – Pick up Stolen Card and Cardholder give up
```
```
50 Invalid Payment Condition
```
```
Ex. Session time out or invalid VbV Password : ask
cardholders to try ma again and complete transaction
within 15 minutes with correct card information.
```
```
51 Insufficient Funds Not enough credit limit to pay. Please contact issuer
```
```
54 Expired Card Cardholder key in invalid expiry date
```
```
58 Transaction not Permitted to
Terminal
```
```
Issuer does not allow to pay with debit card (Visa
Electron, Mastercard Electron)
```
##### 91

```
Issuer or Switch is
Inoperative Issuer system is not available to authorize payment^
```
```
94 Duplicate Transaction Please inform KBank to investigate
```
```
96 System Malfunction Issuer bank system can not give a service
```
```
xx Transaction Timeout Can not receive response code from issuer with in the
time limit
```


