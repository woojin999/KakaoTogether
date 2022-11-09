async function boardCheerToServer(boardData) {
    try {
      const url = "/board/"+boardData.bno;
      console.log(url);
      const config = {
        method: 'PUT', // PATCH도 가능
        headers: {
          'Content-Type':'application/json; charset=utf-8'
        },
        body: JSON.stringify(boardData)
      };
      const resp = await fetch(url, config);
      const result = await resp.text();
      return result;  
    } catch (error) {
      console.log(error);
    }
  }

  document.addEventListener('click', (e) => {
    if(e.target.classList.contains('chrBtn')){
        let chrNumVal = document.getElementById('chrnum').innerText;
        
        const boardData = {
            bno: e.target.dataset.bno,
            cheer: parseInt(chrNumVal)
        };
        boardCheerToServer(boardData).then(result => {
            if(parseInt(result)){
                let cn = document.getElementById('chrnum').innerText;
                cn = parseInt(cn) + parseInt(1) 
                document.getElementById('chrnum').innerText = cn;
                
            }
        });
    }
  });


