
var vm = new Vue({
    el: '#header',
    data: {
        Night: "Night",
        ifnight: false
    },
    methods: {
        change: function () {
            this.ifnight = !this.ifnight;
            if (this.ifnight) {
                this.Night = "Day"
            }
            else
                this.Night = "Night"
        }
    }
});
