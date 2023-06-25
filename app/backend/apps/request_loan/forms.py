import requests
from django import forms
import random

from .models import RequestLoan


class RequestLoanModelForm(forms.ModelForm):

    class Meta:
        model = RequestLoan
        fields = ['gender', 'email', 'document_number', 'full_name', 'amount']

    def clean(self):
        cleaned_data = super().clean()
        # Generate a random fictitious response because the API is not responding
        response_data = {
            'error': False,
            'message': 'Scoring successful',
            'score': random.randint(0, 100)
        }
#       url = "http://endpoint.test.com.ar:7001/api/v1/scoring/?document_number={0}&gender={1}&email={2}" \
#            .format(cleaned_data['document_number'], cleaned_data['gender'].upper(), cleaned_data['email'])
        if response_data.get('error'):
            raise forms.ValidationError("Hubo un error en el servidor, vuelva a intentarlo más tarde.")
        
        return cleaned_data

    def clean_amount(self):
        data = self.cleaned_data['amount']
        if data <= 0:
            raise forms.ValidationError("El monto a solicitar debe ser mayor a cero.")

        return data