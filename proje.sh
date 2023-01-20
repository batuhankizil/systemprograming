#!/bin/bash

echo '1 - Şifreleme'
echo '2 - Şifre Çözme'

echo 'Lütfen Seçiminizi Girin : '
read control

case $control in
	'1')

		echo 'Dosyanızın ismini girin : '
		read fileName

		fileType=$(file -b $fileName)

			case $fileType in
			'JPEG '*)
			 gpg --symmetric -a --output jpeg $fileName
			 cp jpeg Key
                         mv Key $fileName.gpg
			 echo 'Resminiz Şifrelendi'
			 rm jpeg
			 rm $fileName
			 ;;
 			'ASCII '*)
    			 gpg --symmetric --output ŞifrelenmişTxt $fileName
			 rm $fileName
			 echo 'Metin Belgeniz Şifrelendi'
   			 ;;
			'PNG '*)
                         gpg --symmetric -a --output png $fileName
			 cp png Key
                         mv Key $fileName.gpg
			 rm png
			 rm $fileName
			 echo 'Resminiz Şifrelendi'
			 ;;
			'ISO '*)
			 gpg --symmetric --output ŞifrelenmişVideo $fileName
			 rm $fileName
			 echo 'Videonuz Şifrelendi'
			 ;;
			'Audio '*)
			 gpg --symmetric --output ŞifrelenmişMp3 $fileName
			 rm $fileName
			 echo 'Ses Dosyanız Şifrelendi'
			 ;;
			'PDF '*)
			 gpg --symmetric --output ŞifrelenmişPdf $fileName
			 rm $fileName
			 echo 'Pdf Dosyanız Şifrelendi'
			 ;;
			'Zip '*)
			 gpg --symmetric --output ŞifrelenmişZip $fileName
			 rm $fileName
			 echo 'Zip Dosyanız Şifrelendi'
			 ;;
			esac

	;;
	'2')

		echo '1 - Resim Dosyası'
		echo '2 - Txt Dosyası'
		echo '3 - Video Dosyası'
		echo '4 - Ses Dosyası'
		echo '5 - Pdf Dosyası'
		echo '6 - Zip Dosyası'
		echo 'Çözmek İstediğiniz Dosya Tipini Seçin : '
		read choice
		echo 'Dosya Adını Girin : '
		read newFileName

                        case $choice in
                        '1')
			 gpg --decrypt $newFileName > ÇözülmüşResim.jpg
			 rm $newFileName
			 echo ''
			 echo 'Resminiz Çözüldü'
			 ;;
			'2')
			 gpg --decrypt $newFileName > ÇözülmüşMetin.txt
			 rm $newFileName
			 echo ''
			 echo 'Metin Belgeniz Çözüldü'			 
			 ;;
			'3')
			 gpg --decrypt $newFileName > ÇözülmüşVideo.mp4
			 rm $newFileName
			 echo 'Videonuz Çözüldü'
			 ;;
			'4')
			 gpg --decrypt $newFileName > ÇözülmüşSes.mp3
			 rm $newFileName
			 echo 'Ses Dosyanız Çözüldü'
			 ;;
			'5')
			 gpg --decrypt $newFileName > ÇözülmüşPdf.pdf
			 rm $newFileName
			 echo 'Döküman Dosyanız Çözüldü'
			 ;;
			'6')
			 gpg --decrypt $newFileName > ÇözülmüşZip.zip
			 rm $newFileName
			 echo 'Zip Dosyanız Çözüldü'
			 ;;
			esac
	;;
	esac
