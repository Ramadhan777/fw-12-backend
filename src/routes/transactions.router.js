const transactionRouter = require('express').Router()
const { readAllTransactions, createTransaction, updateTransaction, deleteTransaction, readTransaction } = require('../controllers/transactions.controller')
const authMiddleware = require('../middleware/auth.middleware')

transactionRouter.get('/', readAllTransactions)
transactionRouter.get('/:id', readTransaction)
transactionRouter.post('/', createTransaction)
transactionRouter.patch('/:id', updateTransaction)
transactionRouter.delete('/:id', deleteTransaction)

module.exports = transactionRouter
