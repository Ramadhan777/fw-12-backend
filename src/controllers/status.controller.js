const { selectAllStatus, selectStatus, insertStatus, patchStatus, deleteStatus, countAllStatus } = require('../models/Status.model')
const errorHandler = require('../helpers/errorHandler')
const filter = require('../helpers/filter.helper')

exports.readAllStatus = (req, res) => {
  const sortable = ['name', 'createdAt', 'updatedAt']

  filter(req.query, sortable, countAllStatus, res, (filter, pageInfo) => {
    selectAllStatus(filter, (err, result) => {
    if(err){
      return errorHandler(err, res)
    }

    return res.status(200).json({
      success: true,
      message: 'List of Status',
      pageInfo,
      status: result.rows
    })
  })
})
}

exports.readStatus = (req, res) => {
  selectStatus(req.params, (err, data) => {
    if(err){
      return errorHandler(err, res)
    }

    if(data.rows.length === 0) {
      return res.status(400).json({
        success: false,
        message: "Status not found"
      })
    }

    return res.status(200).json({
      success: true,
      Status: data.rows
    })
  })
}

exports.createStatus = (req, res) => {
  insertStatus(req.body, (err, data) => {
    if(err) {
      return errorHandler(err, res)
    }

    return res.status(200).json({
      success: true,
      message: "Status created successfully",
      Status: data.rows[0]
    })
  })
}

exports.updateStatus = (req, res) => {
  patchStatus(req.body, req.params, (err, data) => {
    if(err){
      return errorHandler(err, res)
    }

    if(data.rows.length === 0){
      return res.status(400).json({
        success: false,
        message: "Status doesn't exist"
      })
    }

    return res.status(200).json({
      success: true,
      message: "Status Updated",
      Status: data.rows
    })
  })
}

exports.deleteStatus = (req, res) => {
  deleteStatus(req.params, (err, data) => {
    if(err) {
      return errorHandler(err, res)
    }

    if(data.rows.length === 0){
      return res.status(400).json({
        success: false,
        message: "Status doesn't exist"
      })
    }

    return res.status(200).json({
      success: true,
      message: "Status Deleted",
      Status: data.rows
    })
  })
}
