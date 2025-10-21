function toggleCourseStatus(courseCode, isActive) {
            const action = isActive ? 'active' : 'inactive';
            const actionText = isActive ? 'ativar' : 'inativar';

            if (!confirm('Deseja realmente ' + actionText + ' este curso?')) {
                location.reload();
                return;
            }

            fetch('/course/' + courseCode + '/' + action, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                .then(response => {
                    if (response.ok) {
                        location.reload();
                    } else {
                        alert('Erro ao processar a solicitação');
                        location.reload();
                    }
                })
                .catch(error => {
                    console.error('Erro:', error);
                    alert('Erro ao processar a solicitação');
                    location.reload();
                });
        }