ClassicEditor
.create( document.querySelector( '#reContent' ), {
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
            'redo'
        ]
    },
    language: 'ko',
    licenseKey: '',
} )
.then( editor => {
    window.editor = editor;
} )
.catch( error => {
    console.error( error );
} );