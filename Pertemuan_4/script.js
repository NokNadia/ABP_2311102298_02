document.addEventListener('DOMContentLoaded', () => {
    const btnTampil = document.getElementById('btn-tampil');
    const hasilProfil = document.getElementById('hasil-profil');

    btnTampil.addEventListener('click', () => {
        // Change button state to show loading
        const originalHtml = btnTampil.innerHTML;
        btnTampil.innerHTML = `
            <svg class="animate-spin" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="animation: spin 1s linear infinite;"><path d="M21 12a9 9 0 1 1-6.219-8.56"/></svg>
            Memuat...
        `;
        btnTampil.disabled = true;

        // Add keyframes for spinner if not exists
        if (!document.getElementById('spinner-style')) {
            const style = document.createElement('style');
            style.id = 'spinner-style';
            style.innerHTML = `
                @keyframes spin {
                    from { transform: rotate(0deg); }
                    to { transform: rotate(360deg); }
                }
            `;
            document.head.appendChild(style);
        }

        // Fetch data from PHP file using AJAX
        fetch('data.php')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Formatting according to instructions:
                // Nama: Budi | Pekerjaan: Web Developer | Lokasi: Jakarta
                
                const formattedHtml = `
                    <span class="profil-item"><span class="label">Nama:</span> <span class="value">${data.nama}</span></span>
                    <span class="separator">|</span>
                    <span class="profil-item"><span class="label">Pekerjaan:</span> <span class="value">${data.pekerjaan}</span></span>
                    <span class="separator">|</span>
                    <span class="profil-item"><span class="label">Lokasi:</span> <span class="value">${data.lokasi}</span></span>
                `;

                // Display data
                hasilProfil.innerHTML = formattedHtml;
                hasilProfil.classList.remove('hidden');
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                hasilProfil.innerHTML = '<span style="color: #ef4444;">Gagal mengambil data dari server. Pastikan server PHP dijalankan (misal: php -S localhost:8000).</span>';
                hasilProfil.classList.remove('hidden');
            })
            .finally(() => {
                // Restore button state
                btnTampil.innerHTML = originalHtml;
                btnTampil.disabled = false;
            });
    });
});
