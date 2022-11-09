async function spreadDonationFromServer(bnoVal, pageNo) {
    try {
        const resp = await fetch('/donation/'+bnoVal+"/"+pageNo);
        const pagingHandler = await resp.json();
        return await pagingHandler;
    } catch (error) {
        console.log(error);
    }
}

function trimSendAt(sendAt){
    return sendAt.substring(0, sendAt.length-8);
  }

function getDonationList(bnoVal, pageNo=1) {
    spreadDonationFromServer(bnoVal, pageNo).then(result => {
        console.log(result);

        if(result.donaList.length && pageNo == 1) {
            let tag ='<span class="tit_head" style="margin-bottom: 15px">댓글</span>';
            for(const dvo of result.donaList) {
                tag += `<span class="txt_info" style="font-size: 16px; font-weight: bold; ">${dvo.mno}</span>`
                tag += `<span style="margin-left: 10px;"> ${dvo.donation}원</span>`
                tag += `<span style="float: right">${trimSendAt(dvo.donationAt)}</span>`
                tag += `<div class="txt_cmt" style="margin-top: 10px; margin-bottom: 10px; padding: 13px 14px 17px; border-radius: 10px; background-color: #f7f8f9; word-break: break-word;">`
                tag += `<span>${dvo.comment}</span>`
                tag += `</div>`;
            }
            document.getElementById('donaZone').innerHTML = tag;
        }

        else if(pageNo > 1){
            let tag ='';
            for(const dvo of result.donaList) {
                tag += `<span class="txt_info" style="font-size: 16px; font-weight: bold; ">${dvo.mno}</span>`
                tag += `<span style="margin-left: 10px;"> ${dvo.donation}원</span>`
                tag += `<span style="float: right">${trimSendAt(dvo.donationAt)}</span>`
                tag += `<div class="txt_cmt" style="margin-top: 10px; margin-bottom: 10px; padding: 13px 14px 17px; border-radius: 10px; background-color: #f7f8f9; word-break: break-word;">`
                tag += `<span>${dvo.comment}</span>`
                tag += `</div>`;
            }
            document.getElementById('donaZone').innerHTML += tag;
        } else {

        }

        const moreBtn = document.getElementById('moreBtn');
        if(pageNo < parseInt(Math.ceil(result.totalCount / 10.0))) {
        moreBtn.style.visibility = 'visible';
          let pageIdx = moreBtn.dataset.page;
         moreBtn.dataset.page =  parseInt(pageIdx) + 1;
        }else{
        moreBtn.style.visibility = 'hidden';
         }
    })
}

document.addEventListener('click', (e) => {
    if(e.target.id == 'moreBtn'){
        e.preventDefault();
        const bnoVal = document.getElementById('bnoVal').innerText;
        const page = e.target.dataset.page;
        getDonationList(bnoVal, parseInt(page)+1);
    }
});