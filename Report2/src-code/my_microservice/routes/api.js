var express = require('express');
var router = express.Router();

/* GET greeting. */
router.get('/sayhello', function(req, res, next) {
  res.send('Hello World!');
});

module.exports = router;
