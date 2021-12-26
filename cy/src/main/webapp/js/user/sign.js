Vue.use(vuelidate.default);

new Vue({
  el: '#js-form',
  data: {
    name: '',
    os: '',
    job: '',
    age: null,
    gender: '',
    region: '',
    email: '',
    password: '',
    repeatPassword: '',
    agreement: false
  },
  validations: {
    name: {
      required: validators.required,
      minLength: validators.minLength(4)
    },
    os: {
      required: validators.required
    },
    job: {
      required: validators.required
    },
    age: {
      numeric: validators.numeric,
      between: validators.between(0, 100)
    },
    gender: {},
    region: {},
    email: {
      required: validators.required,
      email: validators.email
    },
    password: {
      required: validators.required,
      minLength: validators.minLength(8)
    },
    repeatPassword: {
      required: validators.required,
      sameAsPassword: validators.sameAs('password')
    }
  },
  methods: {
    submit: function() {
      if (this.$v.$invalid) return;
      // this.$el.submit();
      alert('Thank you!');
    }
  }
});