let noEditor;

ClassicEditor
.create( document.querySelector( '#no_content' ), {
    toolbar: {
        items: [
            'heading',
            '|',
            'bold',
            'italic',
            'link',
            '|',
            'indent',
            'outdent',
            '|',
            'blockQuote',
            'undo',
            'redo',
            '|',
            'imageUpload',
            'imageTextAlternative',
            'imageStyle:full',
            'imageStyle:side',
            '|'
        ]
    },
    cloudServices: {
        tokenUrl: 'https://73243.cke-cs.com/token/dev/65889948d462409ed570e59ae3944b55f7c904a40ac5c9602726e4b98ce8',
        uploadUrl: 'https://73243.cke-cs.com/easyimage/upload/'
    },
    language: 'ko',
    licenseKey: '',
} )
.then( editor => {
    noEditor = editor;
} )
.catch( error => {
    console.error( error );
} );

$(function () {
	$('table tr td a').on('click', function () {
		$('#no_title').val('');
		$('#no_writer').val('');
		noEditor.setData('');
		$('#og_file').val('');
		
		let no_title = "";
		let no_writer = "";
		let no_content = "";
		let no_hidden = "";
		let no_filename = "";
			
		let noticeContent = new Array();
		let no_idx = $(this).parent().prev().html();
	
		$.ajax({
			type: "GET",
			url: "./data/notice_ok.jsp?noIdx=" + no_idx,
			dataType: "json",
			success: function(noticeJSON) {
				no_title = noticeJSON.no_title;
				no_writer = noticeJSON.no_writer;
				no_content = noticeJSON.no_content;
				no_hidden = noticeJSON.no_hidden;
				no_filename = noticeJSON.no_filename;
				
				console.log(no_title);
				$('#noIdx').val(no_idx);
				$('#no_title').val(no_title);
				$('#no_writer').val(no_writer);
				noEditor.setData(no_content);
				$('#og_filename').val(no_filename);
				$('#ogFile').html(no_filename);
				if (no_hidden == 'x') {
					$("input:radio[name='noHidden']:radio[value='x']").prop('checked', true);
				} else {
					$("input:radio[name='noHidden']:radio[value='o']").prop('checked', true);
				}
				$('#btn_wrap').html('<input type="submit" value="수정" id="btn_edit" name="btn_edit"> <input type="button" value="비우기" id="btn_clear">');
	  		$('#btn_clear').on('click', function () {
	  	 		$('#no_title').val('');
	  			$('#no_writer').val('');
	  			noEditor.setData('');
	  			$('#ogFile').html('');
	  			$("input:radio[name='noHidden']").removeAttr("checked");
	  			$('#btn_wrap').html('<input type="submit" value="작성" id="btn_write" name="btn_write">');
	  		});
			}
		});
	});
});

function checkForm() {
	
	if ($('#no_title').val() == '') {
		alert('제목을 입력해주세요');
		return false;
	}
	if ($('#no_writer').val() == '') {
		alert('작성자를 입력해주세요');
		return false;
	}
	if (noEditor.getData() == '') {
		alert('내용을 입력해주세요');
		return false;
	}
	let no_hiddenCheck = false;
	for (let i = 0; i < $('[name="noHidden"]').length; i++) {
   		if ($('[name="noHidden"]').eq(i).is(':checked') == true) {
   			no_hiddenCheck = true;
  	    	break;
    	}
    }
	if (!no_hiddenCheck) {
		alert('숨김 여부를 체크해주세요');
		return false;
	}
	return true;
}